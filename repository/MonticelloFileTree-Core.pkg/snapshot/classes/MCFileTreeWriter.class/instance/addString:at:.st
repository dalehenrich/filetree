
!MCFileTreeWriter methodsFor: 'writing'!
addString: string at: fileName
    | path |
    path := MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ 
            self packageFileDirectory assureExistenceOfPath: MCFileTreeStCypressWriter monticelloMetaDirName.
            MCFileTreeStCypressWriter monticelloMetaDirName , '/' , fileName ]
        ifFalse: [ fileName ].
    string isEmpty
        ifFalse: [ self packageFileDirectory forceNewFileNamed: path do: [ :file | file nextPutAll: string ] ]! !
