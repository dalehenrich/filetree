testing
testIssue74
	"run without errors"

	| dir |
	dir := self getTestRepositoriesDirectory.
	Gofer new
		url: 'gitfiletree://' , (utilityClass directoryPathString: dir) , '/issue72';
		allResolved