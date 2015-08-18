tests
testTargetLoadRepository
	"Check that the target load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver02.2'.
	files := repo allFileNames.
	self assert: files first commitID hex = '1b89e5d6bf644d84f38c479b6dcb23c658a2a95d'