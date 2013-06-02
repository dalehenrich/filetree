git querying
gitVersionsForPackage: aDirectoryEntry
	"Query git for all the versions related to that directory entry"

	| c commitIDs |
	c := PipeableOSProcess
		command: 'cd ' , directory pathString , '; git log --pretty="%H" ' , aDirectoryEntry name.
	commitIDs := c output substrings.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs