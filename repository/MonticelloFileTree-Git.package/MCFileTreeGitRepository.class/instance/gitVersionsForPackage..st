git querying
gitVersionsForPackage: aDirectoryEntry
	"Query git for all the versions related to that directory entry"

	| c commitIDs monticelloMetaDirectory |
	monticelloMetaDirectory := self fileUtils
		directoryFromPath: self class monticelloMetaDirName
		relativeTo: (self fileUtils directoryFromPath: aDirectoryEntry relativeTo: directory).
	c := PipeableOSProcess command: 'cd ' , monticelloMetaDirectory pathString , '; git log --pretty="%H" version'.
	commitIDs := c output substrings.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs