utilities
addClassAndMethodDefinitionsFromEntry: classEntry
	"A class entry here is a ZipDirectoryMember."

	"Would have been convenient to have directory members listing the files they contain."

	| classPropertiesDict classComment methodPropertiesDict entries |
	entries := self zip members
		select: [ :entry | entry isDirectory not and: [ entry fileName beginsWith: classEntry fileName ] ].
	(entries detect: [ :entry | entry splitFileName last = 'properties.json'] ifNone: [  ])
		ifNotNil: [ :propertyEntry | classPropertiesDict := MCFileTreeJsonParser parseStream: (ReadStream on: propertyEntry contents) ].
	(entries detect: [ :entry | entry splitFileName last = 'README.md'] ifNone: [  ])
		ifNotNil: [ :commentEntry | classComment := commentEntry contents ].
	methodPropertiesDict := Dictionary new.
	(entries detect: [ :entry | entry splitFileName last = 'methodProperties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | methodPropertiesDict := MCFileTreeJsonParser parseStream: (ReadStream on: propertyEntry contents) ].
	self addClassDefinitionFrom: classPropertiesDict comment: classComment withSqueakLineEndings.
	self
		addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
		methodProperties: methodPropertiesDict
		in: entries
		root: classEntry