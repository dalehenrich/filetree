actions
packageDescriptionsFromReadableFileNames
	^ ((self readableFileNames collect: [ :fileName | self fileDirectoryOn: fileName ])
		select: [ :packageDirectory | packageDirectory exists ])
		collect: [ :packageDirectory | self packageDescriptionFromPackageDirectory: packageDirectory ]