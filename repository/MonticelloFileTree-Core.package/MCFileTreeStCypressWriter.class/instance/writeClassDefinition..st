writing
writeClassDefinition: definition
    | properties |
    properties := Dictionary new.
    properties at: 'name' put: definition className.
    properties at: 'super' put: definition superclassName.
    definition traitComposition ifNotNil: [ :property | properties at: 'traitcomposition' put: property ].
    definition classTraitComposition ifNotNil: [ :property | properties at: 'classtraitcomposition' put: property ].
    properties at: 'category' put: definition category.
    properties at: 'instvars' put: definition instVarNames asArray.
    properties at: 'classvars' put: definition classVarNames asArray.
    properties at: 'pools' put: definition poolDictionaries asArray.
    properties at: 'classinstvars' put: definition classInstVarNames asArray.
    properties at: 'type' put: definition type asString.
    properties at: 'commentStamp' put: definition commentStamp.
    properties writeCypressJsonOn: fileStream