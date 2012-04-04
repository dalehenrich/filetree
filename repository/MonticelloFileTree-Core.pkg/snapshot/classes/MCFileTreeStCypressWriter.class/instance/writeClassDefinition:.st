
!MCFileTreeStCypressWriter methodsFor: 'writing'!
writeClassDefinition: definition
    | properties |
    properties := Dictionary new.
    properties at: 'name' put: definition className.
    properties at: 'super' put: definition superclassName.
    properties at: 'traitcomposition' put: definition traitComposition.
    properties at: 'classtraitcomposition' put: definition classTraitComposition.
    properties at: 'category' put: definition category.
    properties at: 'instvars' put: definition instVarNames asArray.
    properties at: 'classvars' put: definition classVarNames asArray.
    properties at: 'pools' put: definition poolDictionaries asArray.
    properties at: 'classinstvars' put: definition classInstVarNames asArray.
    properties at: 'type' put: definition type.
    properties at: 'commentStamp' put: definition commentStamp.
    properties writeCypressJsonOn: fileStream! !
