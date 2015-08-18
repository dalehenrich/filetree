tests
testRepository
	| repo files |
	repo := self getTestRepository: 'issue 139'.
	files := repo allFileNames.
	self assert: files first commitID hex = '419d5fe5035877f1bea848961d7475a919731e95'