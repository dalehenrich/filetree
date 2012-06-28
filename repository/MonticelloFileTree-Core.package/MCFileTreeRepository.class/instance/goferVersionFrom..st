as yet unclassified
goferVersionFrom: aVersionReference
    "until we no longer find .tree directories in the wild"

    (((self directory entries select: [:entry | entry isDirectory and: [self canReadFileNamed: entry name]]) collect: [ :entry | self fileDirectoryOn: entry name ])
        select: [ :packageDirectory | packageDirectory exists ])
        collect: [ :packageDirectory | 
            (self versionInfoForPackageDirectory: packageDirectory) name = aVersionReference name
                ifTrue: [ ^ self loadVersionFromFileNamed: packageDirectory localName ] ].
    ^ nil