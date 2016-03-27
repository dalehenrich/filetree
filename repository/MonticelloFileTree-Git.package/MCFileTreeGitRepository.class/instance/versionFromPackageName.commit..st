accessing
versionFromPackageName: aPackageName commit: aCommitID
	"Specific: we count on the fact that the ancestry instance variable contains the git ancestry of the last loadAllFileNames call."
	
	"Explanation for code using the ancestry: if, when storing a dependency along with the package (single commit), that dependency is exactly the same as a previous store, git considers that it hasn't changed and gitfiletree correctly answers that there is no version of the dependency for that commit. We then have to search through the ancestry to find an older commit for that dependency."

	| entry mcR packageName entries |
	packageName := aPackageName , self packageExtension.
	entries := self allFileNames select: [ :each | each packageDirectory = packageName ].
	entry := entries detect: [ :each | each commitID = aCommitID ] ifNone: [  ].
	entry
		ifNil: [ 
			| cid |
			cid := (ancestry at: aCommitID) first.
			[ (entry := entries detect: [ :each | each commitID = cid ] ifNone: [  ]) isNil ]
				whileTrue: [ cid := (ancestry at: cid) first ] ].
	mcR := MCFileTreeGitStReader on: directory fileName: packageName.
	mcR commitID: entry commitID.
	mcR info: entry info.
	mcR repository: self.
	^ mcR version