as yet unclassified
allFileNames
	^ (self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ])
		collect: [ :entry | GitFileTreePackage on: entry name info: (self versionInfoForPackageDirectory: (super fileDirectoryOn: entry name)) ]