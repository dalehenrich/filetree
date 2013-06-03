git querying
gitVersionsForPackage: aDirectoryEntry
	"Query git for all the versions related to that directory entry"

	| c commitIDs |
	c := PipeableOSProcess
		command:
			'cd ' , directory pathString , '/' , aDirectoryEntry name , '/' , self class monticelloMetaDirName
				, '; git log --pretty="%H" version'.
	commitIDs := c output substrings.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs