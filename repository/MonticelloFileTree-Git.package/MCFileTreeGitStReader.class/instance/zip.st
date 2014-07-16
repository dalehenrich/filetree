accessing
zip
	"Get the zip based on the commitID."

	| c output |
	zip isNil
		ifTrue: [ 
			zip := ZipArchive new.
			[ 
			c := PipeableOSProcess
				command:
					'cd "' , (self fileUtils directoryPathString: stream) , '"; git archive --format=zip ' , commitID hex , ' '
						, packageDirectory.
			output := c output.
			c succeeded
				ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ] ]
				ensure: [ c closePipes ].
			zip readFrom: (ReadStream on: output asByteArray) ].
	^ zip