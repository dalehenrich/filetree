as yet unclassified
allFileNames
	versionNameToFileNameMap := Dictionary new.
	^(directory entries select: [:entry | entry isDirectory and: [self canReadFileNamed: entry name]]) collect: [:entry | | vName |
		vName := self versionNameFromFileName: entry name.
		versionNameToFileNameMap at: vName put: entry name.
		vName asMCVersionName]
