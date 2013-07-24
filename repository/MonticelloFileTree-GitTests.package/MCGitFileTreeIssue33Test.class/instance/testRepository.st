testing
testRepository
	| repo files |
	repo := self getTestRepository: 'issue33'.
	files := repo allFileNames.
	self
		assert:
			(files first commitID hex = 'f8daa1be31418b4432cb52413261d2bdeb4bd8f2'
				or: [ files first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908' ])