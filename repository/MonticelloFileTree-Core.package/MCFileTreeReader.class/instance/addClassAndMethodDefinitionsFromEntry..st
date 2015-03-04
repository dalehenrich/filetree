adding
addClassAndMethodDefinitionsFromEntry: classEntry
	| entries classPropertiesDict classComment methodPropertiesDict |
	self flag: 'rename? loadClassDirectory:'.
	self flag: 'try explicit entries by name'.
	
	entries := (self fileUtils directoryFromEntry: classEntry) entries.
	
	classPropertiesDict := self loadClassPropertiesFromEntries: entries.
	classComment := self loadClassCommentFromEntries: entries.
	methodPropertiesDict := self loadMethodPropertiesFromEntries: entries.
	
	self
		addClassDefinitionFrom: classPropertiesDict
		comment: classComment.
	entries
		detect: [ :entry | entry isDirectory and: [ entry name = 'class' ] ]
		ifFound: [ :classSideDirectory |
			self
				addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
				methodProperties: methodPropertiesDict
				extension: false
				meta: true
				in: classSideDirectory ].
	entries
		detect: [ :entry | entry isDirectory and: [ entry name = 'instance' ] ]
		ifFound: [ :instanceSideDirectory |
			self
				addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
				methodProperties: methodPropertiesDict
				extension: false
				meta: false
				in: instanceSideDirectory ].