writing
addString: string at: fileName
    | path |
    path := MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ 
            self packageFileDirectory assureExistenceOfPath: MCFileTreeStCypressWriter monticelloMetaDirName.
            path := MCFileTreeStCypressWriter monticelloMetaDirName , '/' , fileName.
            (self packageFileDirectory directoryNamed: path) containingDirectory assureExistence.
            path ]
        ifFalse: [ fileName ].
    string isEmpty
        ifFalse: [ self packageFileDirectory forceNewFileNamed: path do: [ :file | file nextPutAll: string ] ]