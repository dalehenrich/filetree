testing
testRepository
	| repo files |
	repo := self getTestRepository: 'issue33'.
	files := repo allFileNames.
	Transcript
		cr;
		show: files first commitID hex , ' ' , files first info summary;
		cr.
	self assert: repo allFileNames first commitID hex = 'f8daa1be31418b4432cb52413261d2bdeb4bd8f2'