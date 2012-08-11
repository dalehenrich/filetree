initialize-release
writeDefinitions: aCollection
    | basePath extensionClasses extensionMethodDefinitions |
    self writeBasicDefinitions: aCollection.
    basePath := 'snapshot' , self fileUtils pathNameDelimiter asString , 'classes'
        , self fileUtils pathNameDelimiter asString.
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
    self classDefinitions
        keysAndValuesDo: [ :className :definition | 
            | classPath instanceMethodPath classMethodPath |
            classPath := basePath , definition className , '.class' , self fileUtils pathNameDelimiter asString.
            self writeClassDefinition: definition to: classPath.
            instanceMethodPath := classPath , 'instance' , self fileUtils pathNameDelimiter asString.
            classMethodPath := classPath , 'class' , self fileUtils pathNameDelimiter asString.
            (self methodDefinitions at: className ifAbsent: [ #() ])
                do: [ :methodDefinition | 
                    methodDefinition classIsMeta
                        ifTrue: [ self writeMethodDefinition: methodDefinition to: classMethodPath ]
                        ifFalse: [ self writeMethodDefinition: methodDefinition to: instanceMethodPath ] ] ].
    basePath := 'snapshot' , self fileUtils pathNameDelimiter asString , 'extensions'
        , self fileUtils pathNameDelimiter asString.
    extensionMethodDefinitions
        do: [ :methodDefinition | 
            | methodPath |
            methodPath := basePath , methodDefinition className , '.class' , self fileUtils pathNameDelimiter asString
                ,
                    (methodDefinition classIsMeta
                        ifTrue: [ 'class' ]
                        ifFalse: [ 'instance' ]) , self fileUtils pathNameDelimiter asString.
            self writeMethodDefinition: methodDefinition to: methodPath ]