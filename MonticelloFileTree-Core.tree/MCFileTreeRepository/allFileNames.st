
!MCFileTreeRepository methodsFor: 'as yet unclassified' stamp: 'ezra 10/28/2011 19:24'!
allFileNames
	^(directory entries select: [:entry | entry isDirectory and: [self canReadFileNamed: entry name]]) collect: [:entry | entry name]! !
