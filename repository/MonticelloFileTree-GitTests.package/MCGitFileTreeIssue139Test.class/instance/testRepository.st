tests
testRepository
	| repo files |
	repo := self getTestRepository: 'issue 139'.
	files := repo allFileNames.
	self assert: files first commitID hex = '738eb9172c33331aa978272d2c4803d009333ed6'