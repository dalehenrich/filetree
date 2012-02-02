
!MCFileTreeReader methodsFor: 'utilities' stamp: 'dkh 2/1/2012 19:34'!
loadDefinitions
	| entries |
	definitions := OrderedCollection new.
	entries := packageDirectory entries.
	[ 
	self
		addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
			inDirectory: packageDirectory;
		addClassAndMethodDefinitionsFromDirectoryEntries: entries;
		addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
			inDirectory: packageDirectory ]
		on: Error
		do: [ :error | error halt ]! !
