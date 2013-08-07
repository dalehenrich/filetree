writing
writeMethodHolderDefinitions: aCollection extension: extension to: basePath do: aBlock
   aCollection keysAndValuesDo: [ :className :definition | 
        | classPath instanceMethodPath classMethodPath |
        classPath := basePath , definition className , extension, self fileUtils pathNameDelimiter asString.
        aBlock value: definition value: classPath.
        instanceMethodPath := classPath , 'instance' , self fileUtils pathNameDelimiter asString.
        classMethodPath := classPath , 'class' , self fileUtils pathNameDelimiter asString.
        (self methodDefinitions at: className ifAbsent: [ #() ])
            do: [ :methodDefinition | 
                methodDefinition classIsMeta
                    ifTrue: [ self writeMethodDefinition: methodDefinition to: classMethodPath ]
                    ifFalse: [ self writeMethodDefinition: methodDefinition to: instanceMethodPath ] ] ].
