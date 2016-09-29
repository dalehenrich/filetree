tests
testTargetLoadRepository
	"Check that the target load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver02.2'.
	files := repo allFileNames.
	self assert: files last commitID hex printString = (self getTopCommitFor: 'Cypress-Mocks' in: 'ver02.2')