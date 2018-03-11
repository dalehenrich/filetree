accessing-repository
repositoryProperties
	"Beware: that code has a bad case of hidden recursion inside (defaultRepositoryProperties will call repositoryProperties)."

	repositoryProperties
		ifNil: [ | entries |
			repositoryProperties := Dictionary new.
			entries := self gitEntriesFor: self subDirectoryString.
			(entries detect: [ :entry | entry name = '.filetree' ] ifNone: [  ])
				ifNil: [ repositoryProperties := self defaultRepositoryProperties.
					self writeRepositoryProperties ]
				ifNotNil: [ :configEntry | 
					repositoryProperties := STON
						fromString: (self gitCatFile: configEntry object) ] ].
	^ repositoryProperties