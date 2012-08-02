writing
addString: string at: fileName
    | path |
    path := MCFileTreePackageStructureStWriter useCypressWriter
        ifTrue: [ |dir|
            dir := (self packageFileDirectory /  MCFileTreeStCypressWriter monticelloMetaDirName) ensureDirectory.
		dir := dir resolve: fileName.
		dir parent ensureDirectory.
            dir fullName ]
        ifFalse: [ fileName ].

    string isEmpty 
		ifFalse: [ 
			(self packageFileDirectory resolve: path) writeStreamDo: [ :aStream | aStream nextPutAll: string ]]