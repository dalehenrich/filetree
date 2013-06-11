git querying
gitVersionsForPackage: aDirectoryEntry
	"Query git for all the versions related to that directory entry"
	
	"Problem: if a package is updated without increasing the version, we don't see it."
	
	"Problem 2: if I extend this scan  by using
		c := PipeableOSProcess command: 'cd ' , directory pathString , '; git log --pretty=""%H"" ', aDirectoryEntry.
	I see the additional commits and it takes longer to scan, but, still, I can't load that version (there is a GUI problem anyway with multiple entries with the same version name which is linked to the use of text as items the MCRepositoryInspector GUI, and we select based on the version name)."

	| c commitIDs monticelloMetaDirectory |
	monticelloMetaDirectory := self fileUtils
		directoryFromPath: self class monticelloMetaDirName
		relativeTo: (self fileUtils directoryFromPath: aDirectoryEntry relativeTo: directory).
	c := PipeableOSProcess command: 'cd ' , monticelloMetaDirectory pathString , '; git log --pretty="%H" version'.
	commitIDs := c output substrings.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs