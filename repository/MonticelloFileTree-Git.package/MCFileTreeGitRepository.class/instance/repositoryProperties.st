accessing-repository
repositoryProperties
	repositoryProperties
		ifNil: [ repositoryProperties := Dictionary new.
			(self fileUtils directoryExists: self gitTopDirectory)
				ifFalse: [ self
						error:
							'gitfiletree:// repository '
								, (self fileUtils directoryPathString: self directory) printString
								, ' does not exist.' ].
			((self gitEntriesForPath: directory)
				detect: [ :entry | entry name = '.filetree' ]
				ifNone: [  ])
				ifNil: [ repositoryProperties := self defaultRepositoryProperties.
					self writeRepositoryProperties ]
				ifNotNil: [ :configEntry | 
					repositoryProperties := STON
						fromString: (self gitCatFile: configEntry object) ] ].
	^ repositoryProperties