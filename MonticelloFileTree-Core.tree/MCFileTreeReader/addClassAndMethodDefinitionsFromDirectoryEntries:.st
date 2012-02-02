
!MCFileTreeReader methodsFor: 'utilities' stamp: 'revelations 11/2/2011 14:00'!
addClassAndMethodDefinitionsFromDirectoryEntries: entries
	entries
		do: [ :entry | 
			entry isDirectory
				ifTrue: [ 
					| directory |
					directory := packageDirectory directoryNamed: entry name.
					directory entries do: [ :file | self addDefinitionFromFile: file inDirectory: directory ] ] ]! !
