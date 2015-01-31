utilities
addClassDefinitionFrom: classPropertiesDict comment: classComment
  | typeSymbolOrArray categoryName className |
  typeSymbolOrArray := classPropertiesDict at: 'type' ifAbsent: [ 'normal' ].
  typeSymbolOrArray isArray
    ifTrue: [ 
      typeSymbolOrArray := typeSymbolOrArray
        collect: [ :each | 
          each isArray
            ifTrue: [ each collect: [ :ea | ea asSymbol ] ]
            ifFalse: [ each asSymbol ] ] ]
    ifFalse: [ typeSymbolOrArray := typeSymbolOrArray asSymbol ].
  className := classPropertiesDict at: 'name'.
  categoryName := classPropertiesDict
    at: 'category'
    ifAbsent: [ self packageNameFromPackageDirectory ].
  self validateClassCategory: categoryName for: className.
  definitions
    add:
      (MCClassDefinition
        name: className
        superclassName: (classPropertiesDict at: 'super')
        category: categoryName
        instVarNames: (classPropertiesDict at: 'instvars' ifAbsent: [ #() ])
        classVarNames: (classPropertiesDict at: 'classvars' ifAbsent: [ #() ])
        poolDictionaryNames: (classPropertiesDict at: 'pools' ifAbsent: [ #() ])
        classInstVarNames:
          (classPropertiesDict at: 'classinstvars' ifAbsent: [ #() ])
        type: typeSymbolOrArray
        comment: classComment
        commentStamp: (classPropertiesDict at: 'commentStamp' ifAbsent: [ '' ]))