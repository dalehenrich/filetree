testing
testRepository
	| repo files |
	repo := self getTestRepository: 'issue33.2'.
	files := repo allFileNames.
	self assert: files first commitID hex = '6b56f0838ef7ec773e3878eabb38e6f694293696'