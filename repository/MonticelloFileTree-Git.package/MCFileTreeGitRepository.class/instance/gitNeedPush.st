git querying
gitNeedPush
	"Check if we need a push. Is that message multilingual ?"

	| c o |
	c := PipeableOSProcess
		command: 'cd "' , (self fileUtils directoryPathString: directory) , '"; git log --branches --not --remotes --oneline'.
	o := c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ o size > 1