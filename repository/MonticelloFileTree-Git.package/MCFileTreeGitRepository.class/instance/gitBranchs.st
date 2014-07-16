git querying
gitBranchs
	"Query git for all the branches in the repository"

	"This is used to determine the current branch."

	| c output |
	[ 
	c := PipeableOSProcess command: 'cd "' , (self fileUtils directoryPathString: directory) , '"; git branch'.
	output := c output.
	c succeeded
		ifFalse: [ 
			| error |
			error := c errorPipelineContents.
			self error: 'Git branch error: ' , error ] ]
		ensure: [ c closePipes ].
	^ output substrings