git querying
gitPush
	"Do a push on the repository"

	| c  |
	c := PipeableOSProcess command: 'cd ' , directory pathString , '; git push'.
	c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ]