tests
testExtractingFolderName
	| r |
	r := MCFileTreeGitRemoteRepository
		extractFolderNameFrom: 'git@github.com:bergel/GTInspector-Help.git'.
	self assert: r equals: 'GTInspector-Help'