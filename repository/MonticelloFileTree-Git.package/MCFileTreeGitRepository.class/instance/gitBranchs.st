git querying
gitBranchs
	"Query git for all the branches in the repository"

	"This is used to determine the current branch."

	| c commitIDs |
	c := PipeableOSProcess command: 'cd ' , directory pathString , '; git branch'.
	commitIDs := c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs substrings