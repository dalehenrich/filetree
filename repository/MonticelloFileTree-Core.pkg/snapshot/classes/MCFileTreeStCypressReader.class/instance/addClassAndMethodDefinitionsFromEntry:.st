
!MCFileTreeStCypressReader methodsFor: 'utilities'!
addClassAndMethodDefinitionsFromEntry: classEntry
    | classDirectory classPropertiesDict classComment entries |
    classDirectory := classEntry asFileDirectory.
    (entries := classDirectory entries detect: [ :entry | entry name = 'properties.json' ] ifNone: [  ])
        ifNotNil: [ :propertyEntry | propertyEntry readStreamDo: [ :fileStream | classPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ] ].
    (entries detect: [ :entry | entry name = 'README.md' ] ifNone: [  ])
        ifNotNil: [ :commentEntry | commentEntry readStreamDo: [ :fileStream | classComment := fileStream contents ] ].
    self addClassDefinitionFrom: classPropertiesDict comment: classComment.
    self addMethodDefinitionsForClass: (classPropertiesDict at: 'name') in: entries! !
