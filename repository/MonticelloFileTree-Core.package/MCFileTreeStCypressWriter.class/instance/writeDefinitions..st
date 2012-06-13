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
            classPath := definition className , classDirExtension , FileDirectory slash.
            self writeClassDefinition: definition to: classPath.
            instanceMethodPath := classPath , 'instance' , FileDirectory slash.
            classMethodPath := classPath , 'class' , FileDirectory slash.
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
            classPath := methodDefinition className , classDirExtension , FileDirectory slash.
            self writeExtensionClassDefinition: methodDefinition to: classPath.
            methodPath := classPath
                ,
                    (methodDefinition classIsMeta
                        ifTrue: [ 'class' ]
                        ifFalse: [ 'instance' ]) , FileDirectory slash.
            self writeMethodDefinition: methodDefinition to: methodPath ].
    extensionMethodMap
        keysAndValuesDo: [ :className :classMethodDefinitions | 
            | classPath |
            classPath := className , classDirExtension , FileDirectory slash.
            self
                writeInDirectoryName: classPath
                fileName: 'methodProperties'
                extension: '.json'
                visit: [ self writeMethodProperties: classMethodDefinitions ] ]