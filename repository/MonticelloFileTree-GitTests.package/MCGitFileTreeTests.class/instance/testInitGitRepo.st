tests
testInitGitRepo
	"Test if we can create a git repo."

	| dir c |
	dir := self utilityClass directoryFromPath: 'temp' relativeTo: self utilityClass default.
	self utilityClass ensureDirectoryExists: dir.
	self assert: dir isWritable.
	c := self class gitCreateAndInitRepo: dir.
	c output.
	self assert: c succeeded