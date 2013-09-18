accessing
zip
	"Get the zip based on the commitID."

	| c |
	zip isNil
		ifTrue: [ 
			zip := ZipArchive new.
			c := PipeableOSProcess
				command: 'cd ' , (self fileUtils directoryPathString: stream) , '; git archive --format=zip ' , commitID hex , ' ' , packageDirectory.
			zip readFrom: (ReadStream on: c output asByteArray).
			c succeeded
				ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ] ].
	^ zip