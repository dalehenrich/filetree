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
			| errorString |
			errorString := c errorPipelineContents.
			errorString notEmpty ifTrue: [ self error: 'Git error: ' , errorString].
			r := '' ] ]
		ensure: [ c closePipes ].
	^ r