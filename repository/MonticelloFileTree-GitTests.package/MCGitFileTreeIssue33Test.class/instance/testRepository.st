tests
testRepository
	| repo files |
	repo := self getTestRepository: 'issue33.2'.
	files := repo allFileNames.
	self assert: files last commitID hex printString = (self getTopCommitFor: 'CCC' in: 'issue33.2')