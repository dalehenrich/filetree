utilities
addExtensionClassAndMethodDefinitionsFromEntry: classEntry
    | classDirectory classPropertiesDict methodPropertiesDict entries |
    classDirectory := classEntry asFileDirectory.
    ((entries := classDirectory entries) detect: [ :entry | entry name = 'properties.json' ] ifNone: [  ])
        ifNotNil: [ :propertyEntry | propertyEntry readStreamDo: [ :fileStream | classPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ] ].
    methodPropertiesDict := Dictionary new.
    (entries detect: [ :entry | entry name = 'methodProperties.json' ] ifNone: [  ])
        ifNotNil: [ :propertyEntry | 
            propertyEntry
                readStreamDo: [ :fileStream | 
                    "Issue 33: https://github.com/dalehenrich/filetree/issues/33"
                    methodPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ] ].
    self
        addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
        methodProperties: methodPropertiesDict
        in: entries