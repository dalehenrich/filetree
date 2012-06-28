actions
packageDescriptionFromPackageDirectory: packageDirectory
    | filename info extension |
    filename := packageDirectory localName.
    extension := filename copyFrom: (filename lastIndexOf: $.) to: filename size.
    ^ (self packageExtension ~= '.package'
        or: [ (packageDirectory directoryNamed: MCFileTreeStCypressWriter monticelloMetaDirName) exists ])
        ifTrue: [ 
            info := self versionInfoForPackageDirectory: packageDirectory.
            self parseName: info name extension: extension ]
        ifFalse: [ 
            {(filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1).
            'cypress'.
            1.
            filename} ]