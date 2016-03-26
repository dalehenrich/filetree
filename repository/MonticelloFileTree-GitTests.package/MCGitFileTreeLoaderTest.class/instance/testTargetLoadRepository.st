tests
testTargetLoadRepository
	"Check that the target load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver02.2'.
	files := repo allFileNames.
	self assert: files first commitID hex = '0a3a0b53ae2252421411b8a1dfa5c32923247cfc'