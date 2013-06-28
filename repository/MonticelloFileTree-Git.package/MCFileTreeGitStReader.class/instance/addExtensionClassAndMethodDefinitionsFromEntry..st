utilities
addExtensionClassAndMethodDefinitionsFromEntry: classEntry
	"A class entry here is a ZipDirectoryMember."

	"Would have been convenient to have directory members listing the files they contain."

	| classPropertiesDict methodPropertiesDict entries |
	entries := self zip members select: [ :entry | entry fileName beginsWith: classEntry fileName ].
	(entries detect: [ :entry | entry splitFileName last = 'properties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | classPropertiesDict := MCFileTreeJsonParser parseStream: (self zipEntryContents: propertyEntry) ].
	methodPropertiesDict := Dictionary new.
	(entries detect: [ :entry | entry splitFileName last = 'methodProperties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | methodPropertiesDict := MCFileTreeJsonParser parseStream: (self zipEntryContents: propertyEntry) ].
	self
		addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
		methodProperties: methodPropertiesDict
		in: entries
		root: classEntry