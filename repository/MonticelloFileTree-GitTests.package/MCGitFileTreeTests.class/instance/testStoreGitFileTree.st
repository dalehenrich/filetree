tests
testStoreGitFileTree
	"Create a gitfiletree repo, and store our test package on it. Record the snapshot and compare with a reread."

	| dir c mcR pV |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir ensureDirectory.
	self assert: dir isWritable.
	c := self class gitCreateAndInitRepo: dir.
	c output.
	self assert: c succeeded.
	mcR := MCFileTreeGitRepository new directory: dir.
	self assert: (dir / '.filetree') exists.
	pV := MCWorkingCopy forPackage: (MCPackage named: 'MonticelloFileTree-GitTests').
	mcR
		basicStoreVersion:
			(MCVersion new
				setPackage: (MCPackage named: 'MonticelloFileTree-GitTests')
				info:
					(MCVersionInfo
						name: pV package name , '-MCFileTreeGitTests'
						id: UUID new
						message: 'This is a mock version'
						date: Date today
						time: Time now
						author: 'MCFileTreeGitTests'
						ancestors: #())
				snapshot: pV snapshot
				dependencies: #()).
	mcR assert: (dir / 'MonticelloFileTree-GitTests.package') exists 
