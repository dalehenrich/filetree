tests
testRepository
	| repo files |
	repo := self getTestRepository: 'issue33.2'.
	files := repo allFileNames.
	self assert: files first commitID hex = '98e5847960867d46ce184b6f6e681ab574d95171'