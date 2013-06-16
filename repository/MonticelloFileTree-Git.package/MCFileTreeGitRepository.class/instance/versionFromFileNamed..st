accessing
versionFromFileNamed: aGitFileTreePackageEntry
	"In the GUI, we should have version names (contributeur, version number, branch) for aString instead of the filetree package directory itself. Handle both cases for the moment."

	"Will change when we will be reading the version directly from the git."

	"Add a bit of debugging. Here aString should be a GitFileTreePackageEntry in fact (but probably it isn't)."

	| mcR packageName |
	self assert: aGitFileTreePackageEntry class == GitFileTreePackageEntry.
	packageName := (self class parseName: aGitFileTreePackageEntry info name) first , self packageExtension.
	mcR := MCFileTreeGitStReader on: directory fileName: packageName.
	mcR commitID: aGitFileTreePackageEntry commitID.
	^ mcR version