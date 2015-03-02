accessing
runOSProcessGitCommand: aCommandString in: aDirectory
	| c r |
	[ 
	c := PipeableOSProcess
		command: self gitCommand , ' ', aCommandString
		environment: nil
		workingDir: (MCFileTreeFileUtils current directoryPathString: aDirectory)
		input: nil
		output: nil
		error: nil
		errorPipelineStream: nil.
	r := c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ 
			| errorString |
			errorString := c errorPipelineContents.
			errorString notEmpty
				ifTrue: [ self error: 'Git error: ' , errorString ].
			r := '' ] ]
		ensure: [ c closePipes ].
	^ r