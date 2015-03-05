resources
getWriteTestRepository
	| repo dir |
	dir := utilityClass directoryFromPath: self writeTestRepositoryName relativeTo: utilityClass default.
	(utilityClass directoryExists: dir)
		ifTrue: [ MCFileTreeGitRepository runGitCommand: 'status' in: dir ]
		ifFalse: [ 
			utilityClass ensureDirectoryExists: dir.
			self assert: dir isWritable.
			MCGitFileTreeTests gitCreateAndInitRepo: dir ].
	self assert: (utilityClass directoryExists: dir).
	repo := MCFileTreeGitRepository new directory: dir.
	^ MCRepositoryGroup default repositories detect: [ :each | each = repo ] ifNone: [ repo ]