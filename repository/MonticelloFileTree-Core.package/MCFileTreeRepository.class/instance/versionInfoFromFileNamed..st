as yet unclassified
versionInfoFromFileNamed: aString
	^ self loadVersionInfoFromFileNamed: (versionNameToFileNameMap at: aString ifAbsent: [aString])