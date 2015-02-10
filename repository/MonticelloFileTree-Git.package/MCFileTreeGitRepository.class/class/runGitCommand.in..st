accessing
runGitCommand: aCommandString in: aDirectory
	| c r |
	[ 
	c := PipeableOSProcess
		command:
			self gitCommand , ' -C "' , (MCFileTreeFileUtils current directoryPathString: aDirectory) , '" ' , aCommandString.
	r := c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ 
			self error: 'Git error: ' , c errorPipelineContents.
			r := '' ] ]
		ensure: [ c closePipes ].
	^ r