tests
testStoreGitFileTree
	"Create a gitfiletree repo, and store our test package on it. Record the snapshot and compare with a reread."

	| dir c mcR pV pVInfo |
	dir := self utilityClass directoryFromPath: 'temp' relativeTo: self utilityClass default.
	self utilityClass ensureDirectoryExists: dir.
	self assert: dir isWritable.
	pV := MCWorkingCopy forPackage: (MCPackage named: 'MonticelloFileTree-GitTests').
	pVInfo := pV ancestry ancestors first.
	c := self class gitCreateAndInitRepo: dir author: pVInfo author.
	c output.
	self assert: c succeeded.
	mcR := MCFileTreeGitRepository new directory: dir.
	self assert: (self utilityClass filePathExists: '.filetree' relativeTo: dir).
	mcR
		basicStoreVersion:
			(MCVersion new
				setPackage: (MCPackage named: 'MonticelloFileTree-GitTests')
				info: pVInfo
				snapshot: pV snapshot
				dependencies: #()).
	self assert: (self utilityClass directoryExists: (self utilityClass directoryFromPath: 'MonticelloFileTree-GitTests.package' relativeTo: dir))