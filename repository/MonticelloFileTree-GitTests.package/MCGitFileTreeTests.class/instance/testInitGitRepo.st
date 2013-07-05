tests
testInitGitRepo
	"Test if we can create a git repo."

	| dir c |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir ensureCreateDirectory.
	self assert: dir isWritable.
	c := self class gitCreateAndInitRepo: dir.
	c output.
	self assert: c succeeded