testing
testTargetLoadRepository
	"Check that the target load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver02.2'.
	files := repo allFileNames.
	self assert: files first commitID hex = '6b56f0838ef7ec773e3878eabb38e6f694293696'