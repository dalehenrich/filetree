as yet unclassified
allFileNames
	"When reading the file names, generate GitFileTreePackageEntry objects with the path and the info."

	^ (self directory entries select: [ :entry | entry isDirectory and: [ self canReadFileNamed: entry name ] ])
		collect: [ :entry | GitFileTreePackageEntry on: entry name info: (self versionInfoForPackageDirectory: (super fileDirectoryOn: entry name)) ]