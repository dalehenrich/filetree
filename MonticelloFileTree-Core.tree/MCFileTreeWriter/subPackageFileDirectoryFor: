
!MCFileTreeWriter methodsFor: 'visiting' stamp: 'ezra 10/25/2011 17:29'!
subPackageFileDirectoryFor: directoryName
	^ cachedPackageFileDirectoryEntries
		at: directoryName
		ifAbsentPut: [ 
			(self packageFileDirectory)
				createDirectory: directoryName;
				directoryNamed: directoryName ]! !
