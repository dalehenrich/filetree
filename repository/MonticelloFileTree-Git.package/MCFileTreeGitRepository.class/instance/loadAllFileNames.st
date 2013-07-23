accessing
loadAllFileNames
	"When reading the file names, generate GitFileTreePackageEntry objects with the path and the info."

	| allNames entries commitIDs uuid |
	uuid := UUID new printString.
	allNames := OrderedCollection new.
	entries := self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ].
	'loading packages versions from git'
		displayProgressFrom: 0
		to: entries size
		during: [ :bar | 
			1 to: entries size do: [ :i | 
				(entries at: i)
					in: [ :entry | 
						commitIDs := self gitVersionsForPackage: entry name.
						(commitIDs match: self tag)
							ifFalse: [ self error: 'Unable to find tag in input' ].
						[ commitIDs atEnd ]
							whileFalse: [ 
								| commitID rawInfo info |
								commitID := (commitIDs upToAll: self tag) trimBoth.
								rawInfo := (ReadStream on: (commitIDs upToAll: self tag)) upToAll: ''' message '''.
								rawInfo trimBoth isEmpty
									ifTrue: [ info := nil ]
									ifFalse: [ 
										info := [ 
										((MCFileTreeGitStReader on: directory fileName: entry name) commitID: commitID)
											loadVersionInfo:
												rawInfo , ''' message '''' id ''' , uuid , ''' date '''' time '''' author '''' ancestors () stepChildren ())' ]
											on: KeyNotFound
											do: [ nil ] ].
								info notNil
									ifTrue: [ allNames add: (GitFileTreePackageEntry on: entry name id: commitID info: info) ] ] ].
				bar value: i ] ].
	^ allNames