tests
testRepository
	| repo files |
	repo := self getTestRepository: 'issue33.2'.
	files := repo allFileNames.
	self assert: files first commitID hex = '3e4433640a89e0f933bae3085571ea8b06fe3588'