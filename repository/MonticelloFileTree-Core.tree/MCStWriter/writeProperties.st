
!MCStWriter methodsFor: '*monticellofiletree-core'!
writeProperties
    stream
        nextPutAll: '{ "structureVersion" : "';
        nextPutAll: self structureSignature;
        nextPutAll: '" }';
        cr! !
