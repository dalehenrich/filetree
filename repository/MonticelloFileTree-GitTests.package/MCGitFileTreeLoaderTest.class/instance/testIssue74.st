tests
testIssue74
	"run without errors"

	| dir |
	dir := self getTestRepositoriesDirectory.
	Gofer new
		repository: (MCFileTreeGitRepository new directory: ((utilityClass directoryPathString: dir) , '/issue72') asFileReference);
		allResolved