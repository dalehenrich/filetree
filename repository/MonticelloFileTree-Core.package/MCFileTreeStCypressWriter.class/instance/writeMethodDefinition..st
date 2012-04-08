writing
writeMethodDefinition: definition
    fileStream
        nextPutAll: definition category encodeAsUTF8;
        lf;
        nextPutAll: definition source encodeAsUTF8 withUnixLineEndings