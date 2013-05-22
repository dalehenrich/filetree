utilities
addClassAndMethodDefinitionsFromEntry: classEntry
  | classDirectory classPropertiesDict classComment entries methodPropertiesDict |
  classDirectory := self fileUtils directoryFromEntry: classEntry.
  ((entries := classDirectory entries)
    detect: [ :entry | entry name = 'properties.json' ]
    ifNone: [  ])
    ifNotNil: [ :propertyEntry | 
      propertyEntry
        readStreamDo: [ :fileStream | 
          classPropertiesDict := MCFileTreeJsonParser
            parse: fileStream contents decodeFromUTF8 ] ].
  (entries detect: [ :entry | entry name = 'README.md' ] ifNone: [  ])
    ifNotNil: [ :commentEntry | 
      commentEntry
        readStreamDo: [ :fileStream | classComment := fileStream contents decodeFromUTF8 ] ].
  methodPropertiesDict := Dictionary new.
  (entries
    detect: [ :entry | entry name = 'methodProperties.json' ]
    ifNone: [  ])
    ifNotNil: [ :propertyEntry | 
      propertyEntry
        readStreamDo: [ :fileStream | 
          "Issue 33: https://github.com/dalehenrich/filetree/issues/33"
          methodPropertiesDict := MCFileTreeJsonParser parseStream: fileStream ] ].
  self
    addClassDefinitionFrom: classPropertiesDict
    comment: classComment withSqueakLineEndings.
  self
    addMethodDefinitionsForClass: (classPropertiesDict at: 'name')
    methodProperties: methodPropertiesDict
    in: entries