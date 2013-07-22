tests
testStoreReadGitFileTree
	"Create a gitfiletree repo, and store our test package on it. Record the snapshot and compare with a reread."

	"Problem: order of reading the definitions is different from the order in which the snapshot is extracted."

	| dir c mcR pV pVInfo |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir ensureDirectory.
	self assert: dir isWritable.
	pV := MCWorkingCopy forPackage: (MCPackage named: 'MonticelloFileTree-GitTests').
	pVInfo := pV ancestry ancestors first.
	c := self class gitCreateAndInitRepo: dir author: pVInfo author.
	c output.
	self assert: c succeeded.
	mcR := MCFileTreeGitRepository new directory: dir.
	self assert: (dir / '.filetree') exists.
	mcR
		basicStoreVersion:
			(MCVersion new
				setPackage: (MCPackage named: 'MonticelloFileTree-GitTests')
				info: pVInfo
				snapshot: pV snapshot
				dependencies: #()).
	self assert: (dir / 'MonticelloFileTree-GitTests.package') exists.
	self assert: (mcR versionFromFileNamed: mcR allFileNames first) snapshot definitions size = pV snapshot definitions size