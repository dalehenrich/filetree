testing
testRepository
	| repo |
	repo := self getTestRepository: 'issue33'.
	self assert: repo allFileNames first commitID hex = 'f8daa1be31418b4432cb52413261d2bdeb4bd8f2'