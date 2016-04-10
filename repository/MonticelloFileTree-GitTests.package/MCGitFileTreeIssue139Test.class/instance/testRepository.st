tests
testRepository
	| repo files |
	repo := self getTestRepository: 'issue 139'.
	files := repo allFileNames.
	self assert: files last commitID hex printString = (self getTopCommitFor: 'Issue 139' in: 'issue 139')