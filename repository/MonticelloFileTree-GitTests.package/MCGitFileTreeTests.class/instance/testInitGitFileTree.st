tests
testInitGitFileTree
	"Test if we can create a gitfiletree repo."

	| dir c |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir ensureDirectory.
	self assert: dir isWritable.
	c := PipeableOSProcess command: 'cd ' , dir pathString , '; git init'.
	c output.
	self assert: c succeeded.
	MCFileTreeGitRepository new directory: dir.
	self assert: (dir / '.filetree') exists