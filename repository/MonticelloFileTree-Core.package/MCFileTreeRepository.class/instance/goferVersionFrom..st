as yet unclassified
goferVersionFrom: aVersionReference
    "until we no longer find .tree directories in the wild"

    ((self allPackageNames collect: [ :fileName | self fileDirectoryOn: fileName, self packageExtension ])
        select: [ :packageDirectory | packageDirectory exists ])
        collect: [ :packageDirectory | 
            (self versionInfoForPackageDirectory: packageDirectory) name = aVersionReference name
                ifTrue: [ ^ self loadVersionFromFileNamed: packageDirectory localName ] ].
    ^ nil