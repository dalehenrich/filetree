
!MCFileTreeStCypressWriter methodsFor: 'writing'!
writeClassDefinition: definition
    | properties |
    properties := Dictionary new.
    properties at: 'name' put: definition className.
    properties at: 'super' put: definition className.
    properties at: 'traitcomposition' put: definition className.
    properties at: 'classtraitcomposition' put: definition className.
    properties at: 'category' put: definition className.
    properties at: 'instvars' put: definition className.
    properties at: 'classvars' put: definition className.
    properties at: 'pools' put: definition className.
    properties at: 'classinstvars' put: definition className.
    properties at: 'type' put: definition className.
    properties at: 'commentStamp' put: definition className.
    properties writeCypressJsonOn: fileStream! !
