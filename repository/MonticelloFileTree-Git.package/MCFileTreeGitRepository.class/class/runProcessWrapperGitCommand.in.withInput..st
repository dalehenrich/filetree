private-commands
runProcessWrapperGitCommand: anArrayOfStrings in: aDirectory withInput: aByteArray
	"Enclose all parameters with double quotes to protect."

	| r aCommandString |
	aCommandString := String
		streamContents: [ :stream | 
			anArrayOfStrings
				do: [ :e | 
					stream
						nextPut: $";
						nextPutAll: e;
						nextPutAll: '" ' ] ].
	(Smalltalk
		at: #ProcessWrapper
		ifAbsent: [ self error: 'Please load ProcessWrapper' ])
		ifNotNil: [ :pW | 
			| command |
			command := pW new
				useStdout;
				useStderr;
				startWithCommand:
					self gitCommand , ' -C "'
						, (MCFileTreeFileUtils current directoryPathString: aDirectory)
						, '" ' , aCommandString;
				yourself.
			command nextPutAll: aByteArray.
			command closeStdin.
			command waitForExit.
			self assert: command isRunning not.
			r := command upToEnd.
			command exitCode > 0
				ifTrue: [ | errorString |
					errorString := command errorUpToEnd.
					errorString notEmpty
						ifTrue: [ MCFileTreeGitError new signal: 'Git error: ' , errorString ].
					r := '' ] ].
	^ r