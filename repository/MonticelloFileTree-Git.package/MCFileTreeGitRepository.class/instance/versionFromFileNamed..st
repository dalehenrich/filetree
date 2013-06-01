as yet unclassified
versionFromFileNamed: aGitFileTreePackageEntry
	"In the GUI, we should have version names (contributeur, version number, branch) for aString instead of the filetree package directory itself. Handle both cases for the moment."

	"Will change when we will be reading the version directly from the git."

	"Add a bit of debugging. Here aString should be a GitFileTreePackageEntry in fact (but probably it isn't)."

	self assert: aGitFileTreePackageEntry class == GitFileTreePackageEntry.
	(aGitFileTreePackageEntry endsWith: self packageExtension)
		ifTrue: [ ^ super loadVersionFromFileNamed: aGitFileTreePackageEntry ]
		ifFalse: [ ^ super loadVersionFromFileNamed: (self class parseName: aGitFileTreePackageEntry) first , self packageExtension ]