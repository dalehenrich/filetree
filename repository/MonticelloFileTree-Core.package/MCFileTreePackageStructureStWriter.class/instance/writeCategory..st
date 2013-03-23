writing
writeCategory: categoryName
  stream
    nextChunkPut:
        'SystemOrganization addCategory: #''' , categoryName encodeAsUTF8 asString
            , '''';
    lf