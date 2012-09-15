as yet unclassified
goferVersionFrom: aVersionReference
    "until we no longer find .tree directories in the wild"

    (((self directory entries select: [:entry | entry isDirectory and: [self canReadFileNamed: entry name]]) collect: [ :entry | self fileDirectoryOn: entry name ])
        select: [ :packageDirectory | self fileUtils directoryExists:packageDirectory ])
        collect: [ :packageDirectory | 
            (self versionInfoForPackageDirectory: packageDirectory) name = aVersionReference name
                ifTrue: [ ^ self loadVersionFromFileNamed: (self fileUtils directoryName: packageDirectory) ] ].
    ^ nil
