tests
testBaseLoadRepository
	"Check that the base load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver01.1'.
	files := repo allFileNames.
	self assert: files last commitID hex printString = (self getTopCommitFor: 'Cypress-Mocks' in: 'ver01.1')