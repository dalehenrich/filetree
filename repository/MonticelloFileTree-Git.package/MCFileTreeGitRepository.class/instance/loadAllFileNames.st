accessing
loadAllFileNames
	"When reading the file names, generate GitFileTreePackageEntry objects with the path and the info."

	"Algorithm: may move in a dedicated scanner/parser in the future:
	input :
		line *;
	line :
		log_size log_data ;
	log_size :
		'log size' <integer> ;
	log_data :
		<SHA1> '|' user_name '|' time_stamp '|' message ;
	End of message can be obtained by the log_size entry.
	"

	| allNames entries commitIDs anAncestry |
	allNames := OrderedCollection new.
	entries := self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ].
	'loading packages versions from git'
		displayProgressFrom: 0
		to: entries size
		during: [ :bar | 
			anAncestry := self loadAncestry.
			1 to: entries size do: [ :i | 
				(entries at: i)
					in: [ :entry | 
						| entryVersions v |
						entryVersions := OrderedCollection new.
						commitIDs := self gitVersionsForPackage: entry name.
						[ commitIDs atEnd ]
							whileFalse: [ 
								| logSize commitID author position message dateAndTime |
								(commitIDs match: 'log size ')
									ifFalse: [ self error: 'Unable to find git data in input' ].
								logSize := Integer readFrom: commitIDs.
								commitIDs next.
								position := commitIDs position.
								commitID := ByteArray readHexFrom: (commitIDs upTo: $|) trimBoth.
								author := (commitIDs upTo: $|) onlyLetters.
								dateAndTime := DateAndTime fromString: (commitIDs upTo: $|).
								message := (commitIDs next: logSize + 1 + position - commitIDs position) convertFromSystemString.
								entryVersions
									add:
										(GitFileTreePackageEntry
											on: entry name
											id: commitID
											author: author
											message: message
											timeStamp: dateAndTime) ].
						v := 1.
						entryVersions size to: 1 by: -1 do: [ :j | 
							(entryVersions at: j)
								buildInfoWith: entryVersions
								startingAt: j + 1
								version: v
								ancestry: anAncestry.
							v := v + 1 ].
						allNames addAll: entryVersions ].
				bar value: i ] ].
	^ allNames