testing
testBaseLoadRepository
	"Check that the base load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver01'.
	files := repo allFileNames.
	Transcript
		cr;
		show: files first commitID hex , ' ' , files first info summary;
		cr.
	self assert: repo allFileNames first commitID hex = '65e9904e0ce9608d9e5867bb7e4dc7f37b411e13'