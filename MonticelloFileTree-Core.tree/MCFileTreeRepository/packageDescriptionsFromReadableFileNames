
!MCFileTreeRepository methodsFor: 'actions' stamp: 'ezra 10/28/2011 18:32'!
packageDescriptionsFromReadableFileNames
	^ ((self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
		select: [ :packageDirectory | packageDirectory exists ])
		collect: [ :packageDirectory | self packageDescriptionFromPackageDirectory: packageDirectory ]! !
