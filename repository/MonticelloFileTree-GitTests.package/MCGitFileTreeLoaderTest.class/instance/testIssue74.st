testing
testIssue74
	"run without errors"

	| dir |
	dir := self getTestRepositoriesDirectory.
	Gofer new
		url: 'gitfiletree://' , dir pathString , '/issue72';
		allResolved