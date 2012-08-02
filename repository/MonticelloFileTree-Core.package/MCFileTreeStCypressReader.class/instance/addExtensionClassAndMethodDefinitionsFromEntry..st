utilities
addExtensionClassAndMethodDefinitionsFromEntry: classEntry
    | classDirectory classPropertiesDict methodPropertiesDict entries |

    classDirectory := classEntry asFileReference.

    ((entries := classDirectory entries) detect: [ :entry | entry basename = 'properties.json' ] ifNone: [  ])
        ifNotNil: [ :propertyEntry | 
			propertyEntry asFileReference readStreamDo: [ :fileStream | 
				classPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ]].

    methodPropertiesDict := Dictionary new.
    (entries detect: [ :entry | entry basename = 'methodProperties.json' ] ifNone: [  ])
        ifNotNil: [ :propertyEntry | 
            propertyEntry asFileReference
                readStreamDo: [ :fileStream | 
                    "Issue 33: https://github.com/dalehenrich/filetree/issues/33"
                    methodPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ]].
    self
        addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
        methodProperties: methodPropertiesDict
        in: entries