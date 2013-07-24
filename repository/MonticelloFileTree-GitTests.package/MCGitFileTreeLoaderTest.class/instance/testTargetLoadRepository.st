testing
testTargetLoadRepository
	"Check that the target load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver02'.
	files := repo allFileNames.
	Transcript
		cr;
		show: files first commitID hex , ' ' , files first info summary;
		cr.
	self assert: repo allFileNames first commitID hex = '8d225c9b0158aed04882b0836958672ba8204bf4'