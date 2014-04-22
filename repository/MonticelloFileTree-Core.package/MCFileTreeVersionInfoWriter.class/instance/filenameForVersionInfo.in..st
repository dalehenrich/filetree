private
filenameForVersionInfo: info in: dir

    | filename |
    filename := String streamContents: [:s | 
         s nextPutAll: info name; nextPut: $_; nextPutAll: info id asString].
    ^ MCFileTreeFileUtils current buildPathFrom: { dir. filename }