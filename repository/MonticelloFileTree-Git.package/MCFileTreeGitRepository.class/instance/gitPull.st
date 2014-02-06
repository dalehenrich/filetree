git querying
gitPull
	"Do a pull on the repository."
	
	"The pull may fail because this amounts to a merge (after having done a fetch) and hence may end up in conflicts."

	| c  |
	c := PipeableOSProcess command: 'cd ' , directory pathString , '; git pull'.
	c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ]