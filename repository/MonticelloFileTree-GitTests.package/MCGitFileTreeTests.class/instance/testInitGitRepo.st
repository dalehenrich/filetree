tests
testInitGitRepo
	"Test if we can create a git repo."

	| dir c |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir ensureDirectory.
	self assert: dir isWritable.
	c := PipeableOSProcess command: 'cd ' , dir pathString , '; git init'.
	c output.
	self assert: c succeeded.
