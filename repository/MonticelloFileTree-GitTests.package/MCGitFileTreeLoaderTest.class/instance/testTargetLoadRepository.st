testing
testTargetLoadRepository
	"Check that the target load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver02'.
	files := repo allFileNames.
	self
		assert:
			(files first commitID hex = '8d225c9b0158aed04882b0836958672ba8204bf4'
				or: [ files first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908' ])