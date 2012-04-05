as yet unclassified
versionFromFileNamed: aString
	^ self loadVersionFromFileNamed: (versionNameToFileNameMap at: aString ifAbsent: [aString])