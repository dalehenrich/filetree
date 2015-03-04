tests
testInitGitRepo
	"Test if we can create a git repo."

	| dir |
	dir := self utilityClass directoryFromPath: 'temp' relativeTo: self utilityClass default.
	self utilityClass ensureDirectoryExists: dir.
	self assert: dir isWritable.
	self class gitCreateAndInitRepo: dir.
