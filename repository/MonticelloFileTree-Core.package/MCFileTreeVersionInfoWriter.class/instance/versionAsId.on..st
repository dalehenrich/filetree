printing
versionAsId: aVersionInfo on: s

    s
        nextPutAll: '(id ';
        nextPutAll: (self versionId: aVersionInfo) printString;
        nextPut: $).