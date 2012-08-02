actions
packageDescriptionFromPackageDirectory: packageDirectory
    | filename info extension |
    filename := packageDirectory basename.
    extension := packageDirectory extension.
    ^ ((self packageExtension ~= 'package'
        and: [ (packageDirectory / 'version') exists and: [ (packageDirectory/ 'package') exists ] ])
        or: [ (packageDirectory / MCFileTreeStCypressWriter monticelloMetaDirName) exists ])
        ifTrue: [ 
            info := self versionInfoForPackageDirectory: packageDirectory.
            self parseName: info name extension: extension ]
        ifFalse: [ 
            {(filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1).
            'cypress'.
            1.
            filename} ]