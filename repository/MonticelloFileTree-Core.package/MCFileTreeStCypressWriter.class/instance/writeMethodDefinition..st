writing
writeMethodDefinition: definition
  fileStream
    nextPutAll: definition category encodeAsUTF8 asString;
    lf;
    nextPutAll: definition source withUnixLineEndings encodeAsUTF8 asString