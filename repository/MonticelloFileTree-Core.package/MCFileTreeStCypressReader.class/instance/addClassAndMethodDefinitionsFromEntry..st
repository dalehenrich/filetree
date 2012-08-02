utilities
addClassAndMethodDefinitionsFromEntry: classEntry
	| classDirectory classPropertiesDict classComment entries methodPropertiesDict |
	
	classDirectory := classEntry asFileReference.
	
	((entries := classDirectory entries) detect: [ :entry | entry basename = 'properties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | 
			propertyEntry asFileReference readStreamDo: [ :fileStream | 
				classPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ]].
	
	(entries detect: [ :entry | entry basename = 'README.md' ] ifNone: [  ])
		ifNotNil: [ :commentEntry | 
			commentEntry asFileReference readStreamDo: [ :fileStream | 
				classComment := fileStream contents ]].
		
	methodPropertiesDict := Dictionary new.
	(entries detect: [ :entry | entry basename = 'methodProperties.json' ] ifNone: [  ])
		ifNotNil: [ :propertyEntry | 
			propertyEntry asFileReference	readStreamDo: [ :fileStream | 
				"Issue 33: https://github.com/dalehenrich/filetree/issues/33"
				methodPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ]].
		
	self addClassDefinitionFrom: classPropertiesDict comment: classComment withSqueakLineEndings.
	self
		addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
		methodProperties: methodPropertiesDict
		in: entries