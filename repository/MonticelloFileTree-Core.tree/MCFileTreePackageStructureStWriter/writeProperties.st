
!MCFileTreePackageStructureStWriter methodsFor: 'writing'!
writeProperties
    stream
        nextPut: ${;
        cr;
        nextPutAll: '    "noMethodMetaData" : true,';
        cr;
        nextPutAll: '    "separateMethodMetaAndSource" : false,';
        cr;
        nextPutAll: '    "snapshotStructure" : ' , self class useSnapShotWriter asString;
        cr;
        nextPut: $};
        cr! !
