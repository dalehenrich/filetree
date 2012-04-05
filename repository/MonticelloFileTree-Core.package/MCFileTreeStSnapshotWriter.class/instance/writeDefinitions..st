initialize-release
writeDefinitions: aCollection
    | basePath extensionClasses extensionMethodDefinitions |
    self writeBasicDefinitions: aCollection.
    basePath := 'snapshot' , FileDirectory slash , 'classes' , FileDirectory slash.
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
            classPath := basePath , definition className , '.class' , FileDirectory slash.
            self writeClassDefinition: definition to: classPath.
            instanceMethodPath := classPath , 'instance' , FileDirectory slash.
            classMethodPath := classPath , 'class' , FileDirectory slash.
            (self methodDefinitions at: className ifAbsent: [ #() ])
                do: [ :methodDefinition | 
                    methodDefinition classIsMeta
                        ifTrue: [ self writeMethodDefinition: methodDefinition to: classMethodPath ]
                        ifFalse: [ self writeMethodDefinition: methodDefinition to: instanceMethodPath ] ] ].
    basePath := 'snapshot' , FileDirectory slash , 'extensions' , FileDirectory slash.
    extensionMethodDefinitions
        do: [ :methodDefinition | 
            | methodPath |
            methodPath := basePath , methodDefinition className , '.class' , FileDirectory slash
                ,
                    (methodDefinition classIsMeta
                        ifTrue: [ 'class' ]
                        ifFalse: [ 'instance' ]) , FileDirectory slash.
            self writeMethodDefinition: methodDefinition to: methodPath ]