
!MCFileTreeStSnapshotWriter methodsFor: 'initialize-release'!
writeDefinitions: aCollection
    | basePath extensionClasses extensionMethodDefinitions |
    super writeDefinitions: aCollection.
    basePath := 'snapshot' , FileDirectory slash , 'classes' , FileDirectory slash.
    extensionClasses := OrderedCollection new.
    extensionMethodDefinitions := OrderedCollection new.
    self methodDefinitions
        keysAndValuesDo: [ :class :extensionMethods | 
            self classDefinitions
                at: class theNonMetaClass
                ifAbsent: [ 
                    extensionClasses add: class.
                    extensionMethodDefinitions addAll: extensionMethods ] ].
    extensionClasses do: [ :class | self methodDefinitions removeKey: class ].
    self classDefinitions
        keysAndValuesDo: [ :class :definition | 
            | classPath methodPath |
            classPath := basePath , definition className , '.class' , FileDirectory slash.
            self writeClassDefinition: definition to: classPath.
            methodPath := classPath , 'instance' , FileDirectory slash.
            (self methodDefinitions at: class ifAbsent: [ #() ])
                do: [ :methodDefinition | self writeMethodDefinition: methodDefinition to: methodPath ].
            methodPath := classPath , 'class' , FileDirectory slash.
            (self methodDefinitions at: class theMetaClass ifAbsent: [ #() ])
                do: [ :methodDefinition | self writeMethodDefinition: methodDefinition to: methodPath ] ].
    basePath := 'snapshot' , FileDirectory slash , 'extensions' , FileDirectory slash.
    extensionMethodDefinitions
        do: [ :methodDefinition | 
            | methodPath |
            methodPath := basePath , methodDefinition className , '.class' , FileDirectory slash
                ,
                    (methodDefinition classIsMeta
                        ifTrue: [ 'class' ]
                        ifFalse: [ 'instance' ]) , FileDirectory slash.
            self writeMethodDefinition: methodDefinition to: methodPath ]! !
