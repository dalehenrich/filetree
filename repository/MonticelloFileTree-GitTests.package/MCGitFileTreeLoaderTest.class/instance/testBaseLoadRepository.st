testing
testBaseLoadRepository
	"Check that the base load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver01.1'.
	files := repo allFileNames.
	self assert: files first commitID hex = '6b56f0838ef7ec773e3878eabb38e6f694293696'