utilities
addClassDefinitionFrom: classPropertiesDict comment: classComment
    | typeSymbolOrArray |
    typeSymbolOrArray := classPropertiesDict at: 'type' ifAbsent: [ 'normal' ].
    typeSymbolOrArray isArray 
        ifTrue: [ typeSymbolOrArray := typeSymbolOrArray collect: [:each | each isArray ifTrue: [ each collect: [:ea | ea asSymbol ]] ifFalse: [ each asSymbol ] ] ]
        ifFalse: [ typeSymbolOrArray := typeSymbolOrArray asSymbol ].
    definitions
        add:
            (MCClassDefinition
                name: (classPropertiesDict at: 'name')
                superclassName: (classPropertiesDict at: 'super')
                category: (classPropertiesDict at: 'category' ifAbsent: [ self packageNameFromPackageDirectory ])
                instVarNames: (classPropertiesDict at: 'instvars' ifAbsent: [ #() ])
                classVarNames: (classPropertiesDict at: 'classvars' ifAbsent: [ #() ])
                poolDictionaryNames: (classPropertiesDict at: 'pools' ifAbsent: [ #() ])
                classInstVarNames: (classPropertiesDict at: 'classinstvars' ifAbsent: [ #() ])
                type: typeSymbolOrArray
                comment: classComment decodeFromUTF8
                commentStamp: (classPropertiesDict at: 'commentStamp' ifAbsent: [ '' ]))
