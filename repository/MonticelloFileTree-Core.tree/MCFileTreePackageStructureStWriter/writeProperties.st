
!MCFileTreePackageStructureStWriter methodsFor: 'writing'!
writeProperties
    stream
        nextPutAll: '{ "structureVersion" : "';
        nextPutAll: self structureSignature;
        nextPutAll: '" }';
        cr! !
