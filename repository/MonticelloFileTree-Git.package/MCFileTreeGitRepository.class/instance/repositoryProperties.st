accessing-repository
repositoryProperties
	repositoryProperties
		ifNil: [ | entries |
			entries := self gitEntriesForPath: directory.
			entries isEmpty
				ifTrue: [ self
						error:
							'gitfiletree:// repository '
								, (self fileUtils directoryPathString: self directory) printString
								, ' does not exist.' ].
			(entries detect: [ :entry | entry name = '.filetree' ] ifNone: [  ])
				ifNil: [ repositoryProperties := self defaultRepositoryProperties.
					self writeRepositoryProperties ]
				ifNotNil: [ :configEntry | 
					repositoryProperties := STON
						fromString: (self gitCatFile: configEntry object) ] ].
	^ repositoryProperties