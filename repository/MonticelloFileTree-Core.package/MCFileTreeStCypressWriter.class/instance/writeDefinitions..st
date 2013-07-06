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
    extensionClasses do: [ :className | self methodDefinitions removeKey: className ].
    classDirExtension := '.class'.
    self classDefinitions
        keysAndValuesDo: [ :className :definition | 
            | classPath instanceMethodPath classMethodPath |
            classPath := definition className , classDirExtension , self fileUtils pathNameDelimiter asString.
            self writeClassDefinition: definition to: classPath.
            instanceMethodPath := classPath , 'instance' , self fileUtils pathNameDelimiter asString.
            classMethodPath := classPath , 'class' , self fileUtils pathNameDelimiter asString.
            (self methodDefinitions at: className ifAbsent: [ #() ])
                do: [ :methodDefinition | 
                    methodDefinition classIsMeta
                        ifTrue: [ self writeMethodDefinition: methodDefinition to: classMethodPath ]
                        ifFalse: [ self writeMethodDefinition: methodDefinition to: instanceMethodPath ] ] ].
    classDirExtension := '.extension'.
    extensionMethodMap := Dictionary new.
    extensionMethodDefinitions
        do: [ :methodDefinition | 
            | classPath methodPath |
            (extensionMethodMap
                at: methodDefinition className
                ifAbsent: [ extensionMethodMap at: methodDefinition className put: OrderedCollection new ])
                add: methodDefinition.
            classPath := methodDefinition className , classDirExtension , self fileUtils pathNameDelimiter asString.
            self writeExtensionClassDefinition: methodDefinition to: classPath.
            methodPath := classPath
                ,
                    (methodDefinition classIsMeta
                        ifTrue: [ 'class' ]
                        ifFalse: [ 'instance' ]) , self fileUtils pathNameDelimiter asString.
            self writeMethodDefinition: methodDefinition to: methodPath ].
    extensionMethodMap
        keysAndValuesDo: [ :className :classMethodDefinitions | 
            | classPath |
            classPath := className , classDirExtension , self fileUtils pathNameDelimiter asString.
            self
                writeInDirectoryName: classPath
                fileName: 'methodProperties'
                extension: '.ston'
                visit: [ self writeMethodProperties: classMethodDefinitions ] ]