utilities
addClassDefinitionFrom: classPropertiesDict comment: classComment
    definitions
        add:
            (MCClassDefinition
                name: (classPropertiesDict at: 'name')
                superclassName: (classPropertiesDict at: 'super')
                traitComposition: (classPropertiesDict at: 'traitcomposition' ifAbsent: [ '{}' ])
                classTraitComposition: (classPropertiesDict at: 'classtraitcomposition' ifAbsent: [ '{}' ])
                category: (classPropertiesDict at: 'category' ifAbsent: [ self packageNameFromPackageDirectory ])
                instVarNames: (classPropertiesDict at: 'instvars' ifAbsent: [ #() ])
                classVarNames: (classPropertiesDict at: 'classvars' ifAbsent: [ #() ])
                poolDictionaryNames: (classPropertiesDict at: 'pools' ifAbsent: [ #() ])
                classInstVarNames: (classPropertiesDict at: 'classinstvars' ifAbsent: [ #() ])
                type: (classPropertiesDict at: 'type' ifAbsent: [ 'normal' ]) asSymbol
                comment: classComment
                commentStamp: (classPropertiesDict at: 'commentStamp' ifAbsent: [ '' ]))