utility
getWriteTestRepository
	| repo dir c |
	dir := utilityClass directoryFromPath: 'temp' relativeTo: utilityClass default.
	(utilityClass directoryExists: dir)
		ifTrue: [ 
			c := PipeableOSProcess command: 'cd ' , (utilityClass directoryPathString: dir) , '; git status'.
			c output.
			self assert: c succeeded ]
		ifFalse: [ 
			utilityClass ensureDirectoryExists: dir.
			self assert: dir isWritable.
			c := MCGitFileTreeTests gitCreateAndInitRepo: dir.
			c output.
			self assert: c succeeded ].
	self assert: (utilityClass directoryExists: dir).
	repo := MCFileTreeGitRepository new directory: dir.
	^ MCRepositoryGroup default repositories detect: [ :each | each = repo ] ifNone: [ repo ]