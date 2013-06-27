utility
getWriteTestRepository
	| repo dir c |
	dir := FileSystem disk workingDirectory / 'temp'.
	dir exists
		ifTrue: [ 
			c := PipeableOSProcess command: 'cd ' , dir pathString , '; git status'.
			c output.
			self assert: c succeeded ]
		ifFalse: [ 
			dir ensureDirectory.
			self assert: dir isWritable.
			c := PipeableOSProcess command: 'cd ' , dir pathString , '; git init'.
			c output.
			self assert: c succeeded ].
	self assert: dir isDirectory.
	repo := MCFileTreeGitRepository new directory: dir.
	^ MCRepositoryGroup default repositories detect: [ :each | each = repo ] ifNone: [ repo ]