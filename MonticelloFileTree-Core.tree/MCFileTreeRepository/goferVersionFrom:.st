
!MCFileTreeRepository methodsFor: 'as yet unclassified'!
goferVersionFrom: aVersionReference
	^ self loadVersionFromFileNamed: (self treeDirectoryNameForVersionNamed: aVersionReference name)! !
