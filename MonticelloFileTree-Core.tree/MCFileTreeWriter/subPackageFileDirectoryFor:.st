
!MCFileTreeWriter methodsFor: 'visiting'!
subPackageFileDirectoryFor: directoryName
	^ cachedPackageFileDirectoryEntries
		at: directoryName
		ifAbsentPut: [ 
			(self packageFileDirectory)
				createDirectory: directoryName;
				directoryNamed: directoryName ]! !
