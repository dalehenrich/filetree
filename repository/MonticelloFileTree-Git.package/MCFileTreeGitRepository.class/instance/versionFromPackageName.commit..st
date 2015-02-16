accessing
versionFromPackageName: aPackageName commit: aCommitID
	| entry mcR packageName |
	packageName := aPackageName , self packageExtension.
	entry := self allFileNames detect: [ :each | each packageDirectory = packageName and: [ each commitID = aCommitID ] ].
	mcR := MCFileTreeGitStReader on: directory fileName: packageName.
	mcR commitID: aCommitID.
	mcR info: entry info.
	mcR repository: self.
	^ mcR version