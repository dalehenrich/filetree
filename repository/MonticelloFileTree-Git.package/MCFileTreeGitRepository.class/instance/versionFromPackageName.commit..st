accessing
versionFromPackageName: aPackageName commit: aCommitID
	| entry mcR packageName entries |
	packageName := aPackageName , self packageExtension.
	entries := self allFileNames select: [ :each | each packageDirectory = packageName ].
	entry := entries detect: [ :each | each commitID = aCommitID ] ifNone: [  ].
	entry
		ifNil: [ 
			| cid |
			cid := (cache at: aCommitID) first.
			[ (entry := entries detect: [ :each | each commitID = cid ] ifNone: [  ]) isNil ]
				whileTrue: [ cid := (cache at: cid) first ] ].
	mcR := MCFileTreeGitStReader on: directory fileName: packageName.
	mcR commitID: entry commitID.
	mcR info: entry info.
	mcR repository: self.
	^ mcR version