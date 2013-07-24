testing
testBaseLoadRepository
	"Check that the base load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver01'.
	files := repo allFileNames.
	self
		assert:
			(files first commitID hex = '65e9904e0ce9608d9e5867bb7e4dc7f37b411e13'
				or: [ files first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908' ])