accessing
loadPackage
    (packageDirectory directoryNamed: MCFileTreeStCypressWriter monticelloMetaDirName) exists
        ifTrue: [ ^ super loadPackage ].
    package := MCPackage named: self packageNameFromPackageDirectory