utilities
addExtensionClassAndMethodDefinitionsFromEntry: classEntry
    | classDirectory classPropertiesDict entries |
    classDirectory := classEntry asFileDirectory.
    ((entries := classDirectory entries) detect: [ :entry | entry name = 'properties.json' ] ifNone: [  ])
        ifNotNil: [ :propertyEntry | propertyEntry readStreamDo: [ :fileStream | classPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ] ].
    self addMethodDefinitionsForClass: (classPropertiesDict at: 'name') in: entries