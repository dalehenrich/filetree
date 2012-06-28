accessing
basicVersion
    (packageDirectory directoryNamed: MCFileTreeStCypressWriter monticelloMetaDirName) exists
        ifTrue: [ ^ super basicVersion ].
    ^ MCVersion new
        setPackage: self package
            info: self info
            snapshot: self snapshot
            dependencies: #();
        yourself