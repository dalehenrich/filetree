tests
testInitGitFileTree
	"Test if we can create a gitfiletree repo."

	| dir c |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir ensureCreateDirectory.
	self assert: dir isWritable.
	c := self class gitCreateAndInitRepo: dir.
	c output.
	self assert: c succeeded.
	MCFileTreeGitRepository new directory: dir.
	self assert: (dir / '.filetree') exists