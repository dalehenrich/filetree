initialize-release
writeDefinitions: aCollection
  | classDirExtension extensionClasses extensionMethodDefinitions extensionMethodMap |
  self writeBasicDefinitions: aCollection.
  extensionClasses := OrderedCollection new.
  extensionMethodDefinitions := OrderedCollection new.
  self methodDefinitions
    keysAndValuesDo: [ :className :extensionMethods | 
      self classDefinitions
        at: className
        ifAbsent: [ 
          extensionClasses add: className.
          extensionMethodDefinitions addAll: extensionMethods ] ].
  extensionClasses
    do: [ :className | self methodDefinitions removeKey: className ].
  classDirExtension := '.class'.
  self classDefinitions
    keysAndValuesDo: [ :className :definition | 
      | classPath instanceMethodPath classMethodPath filenameMetaMap theMethodDefinitions |
      classPath := definition className , classDirExtension
        , self fileUtils pathNameDelimiter asString.
      self writeClassDefinition: definition to: classPath.
      instanceMethodPath := classPath , 'instance'
        , self fileUtils pathNameDelimiter asString.
      classMethodPath := classPath , 'class'
        , self fileUtils pathNameDelimiter asString.
      theMethodDefinitions := self methodDefinitions
        at: className
        ifAbsent: [ #() ].
      filenameMetaMap := self fileNameMapFor: theMethodDefinitions.
      theMethodDefinitions
        do: [ :methodDefinition | 
          | filename |
          filename := (filenameMetaMap at: methodDefinition classIsMeta)
            at: methodDefinition selector.
          methodDefinition classIsMeta
            ifTrue: [ 
              self
                writeMethodDefinition: methodDefinition
                to: classMethodPath
                filename: filename ]
            ifFalse: [ 
              self
                writeMethodDefinition: methodDefinition
                to: instanceMethodPath
                filename: filename ] ] ].
  classDirExtension := '.extension'.
  extensionMethodMap := Dictionary new.
  extensionMethodDefinitions
    do: [ :methodDefinition | 
      | classPath methodPath |
      (extensionMethodMap
        at: methodDefinition className
        ifAbsent: [ extensionMethodMap at: methodDefinition className put: OrderedCollection new ])
        add: methodDefinition.
      classPath := methodDefinition className , classDirExtension
        , self fileUtils pathNameDelimiter asString.
      self writeExtensionClassDefinition: methodDefinition to: classPath ].
  extensionMethodMap
    keysAndValuesDo: [ :className :classMethodDefinitions | 
      | classPath filenameMetaMap |
      filenameMetaMap := self fileNameMapFor: classMethodDefinitions.
      classMethodDefinitions
        do: [ :methodDefinition | 
          | filename methodPath |
          filename := (filenameMetaMap at: methodDefinition classIsMeta)
            at: methodDefinition selector.
          classPath := methodDefinition className , classDirExtension
            , self fileUtils pathNameDelimiter asString.
          methodPath := classPath
            ,
              (methodDefinition classIsMeta
                ifTrue: [ 'class' ]
                ifFalse: [ 'instance' ])
            , self fileUtils pathNameDelimiter asString.
          self
            writeMethodDefinition: methodDefinition
            to: methodPath
            filename: filename ].
      classPath := className , classDirExtension
        , self fileUtils pathNameDelimiter asString.
      self
        writeInDirectoryName: classPath
        fileName: 'methodProperties'
        extension: self propertyFileExtension
        visit: [ self writeMethodProperties: classMethodDefinitions ] ]