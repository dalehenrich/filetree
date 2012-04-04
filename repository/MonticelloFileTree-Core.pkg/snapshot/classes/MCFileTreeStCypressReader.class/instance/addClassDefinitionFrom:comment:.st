
!MCFileTreeStCypressReader methodsFor: 'utilities'!
addClassDefinitionFrom: classPropertiesDict comment: classComment
    definitions
        add:
            (MCClassDefinition
                name: (classPropertiesDict at: 'name')
                superclassName: (classPropertiesDict at: 'super')
                traitComposition: (classPropertiesDict at: 'traitcomposition' ifAbsent: [ '{}' ])
                classTraitComposition: (classPropertiesDict at: 'classtraitcomposition' ifAbsent: [ '{}' ])
                category: (classPropertiesDict at: 'category')
                instVarNames: ((classPropertiesDict at: 'instvars') findTokens: ' ')
                classVarNames: ((classPropertiesDict at: 'classvars') findTokens: ' ')
                poolDictionaryNames: ((classPropertiesDict at: 'pools') findTokens: ' ')
                classInstVarNames: (classPropertiesDict at: 'classinstvars')
                type: (classPropertiesDict at: 'type')
                comment: classComment
                commentStamp: (classPropertiesDict at: 'commentStamp'))! !
