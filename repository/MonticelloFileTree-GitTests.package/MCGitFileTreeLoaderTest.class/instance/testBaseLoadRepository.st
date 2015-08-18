tests
testBaseLoadRepository
	"Check that the base load repository is the one we expect"

	| repo files |
	repo := self getTestRepository: 'ver01.1'.
	files := repo allFileNames.
	self assert: files first commitID hex = '90343dd80ee14690ab262f1e13adb190f43b605c'