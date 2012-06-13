writing
writeMethodDefinition: definition
    fileStream
        nextPutAll: definition category encodeAsUTF8;
        lf;
        nextPutAll: definition source withUnixLineEndings encodeAsUTF8