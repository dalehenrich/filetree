utilities
loadDefinitionFor: aMCDefinition
	"Load the definition in this commit for that MCDefinition."

	| classPropertiesDict methodPropertiesDict entries classEntry |
	self zipForDefinition: aMCDefinition.
	classEntry := packageDirectory , self slash , aMCDefinition class.
	entries := self zip members select: [ :entry | entry isDirectory not and: [ entry fileName beginsWith: classEntry ] ].
	(entries detect: [ :entry | entry splitFileName last = 'properties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | classPropertiesDict := MCFileTreeJsonParser parseStream: (self zipEntryContents: propertyEntry) ].
	methodPropertiesDict := Dictionary new.
	(entries detect: [ :entry | entry splitFileName last = 'methodProperties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | methodPropertiesDict := MCFileTreeJsonParser parseStream: (self zipEntryContents: propertyEntry) ].
	self
		addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
		methodProperties: methodPropertiesDict
		in: entries
		root: classEntry.
	^ definitions