adding
addExtensionClassAndMethodDefinitionsFromEntry: classEntry
	|  classPropertiesDict methodPropertiesDict entries |
	self flag: 'rename? loadExtensionDirectory:'.
	
	entries := (self fileUtils directoryFromEntry: classEntry) entries.
	
	classPropertiesDict := self loadClassPropertiesFromEntries: entries.
	methodPropertiesDict := self loadMethodPropertiesFromEntries: entries.

	entries
		detect: [ :entry | entry isDirectory and: [ entry name = 'class' ] ]
		ifFound: [ :classSideDirectory |
			self
				addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
				methodProperties: methodPropertiesDict
				extension: true
				meta: true
				in: classSideDirectory ].
	entries
		detect: [ :entry | entry isDirectory and: [ entry name = 'instance' ] ]
		ifFound: [ :instanceSideDirectory |
			self
				addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
				methodProperties: methodPropertiesDict
				extension: true
				meta: false
				in: instanceSideDirectory ].