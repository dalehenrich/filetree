private
filenameForVersionInfo: info in: dir

    ^ String streamContents: [:s |
        s nextPutAll: dir; nextPut: $/.
        s nextPutAll: info name; nextPut: $_; nextPutAll: info id asString].