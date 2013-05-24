as yet unclassified
testGofer
	"run without errors"
	| dir |
	dir := self getTestRepositoriesDirectory.
	Gofer new
    		url: 'filetree://', dir pathString, '/issue72';
    		allResolved