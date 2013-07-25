git querying
gitVersions
	"Query git for all the commits in the repository"

	"This is used to establish an ancestry chain package per package."

	| c commitIDs |
	c := PipeableOSProcess
		command: 'cd ' , directory pathString , '; git log --format="commit %H %P"'.
	commitIDs := ReadStream on: c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs