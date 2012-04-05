as yet unclassified
goferVersionFrom: aVersionReference
    "until we no longer find .tree directories in the wild"

    ((self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
        select: [ :packageDirectory | packageDirectory exists ])
        collect: [ :packageDirectory | 
            (self versionInfoForPackageDirectory: packageDirectory) name = aVersionReference name
                ifTrue: [ ^ self loadVersionFromFileNamed: packageDirectory localName ] ].
    ^ nil