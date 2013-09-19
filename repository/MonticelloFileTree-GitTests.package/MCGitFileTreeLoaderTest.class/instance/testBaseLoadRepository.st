testing
testBaseLoadRepository
	"Check that the base load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver01.1'.
	files := repo allFileNames.
	self assert: files first commitID hex = '0a3a0b53ae2252421411b8a1dfa5c32923247cfc'