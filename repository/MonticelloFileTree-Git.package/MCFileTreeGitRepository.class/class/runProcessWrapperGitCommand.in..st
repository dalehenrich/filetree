accessing
runProcessWrapperGitCommand: aCommandString in: aDirectory
	| r |
	(Smalltalk at: #ProcessWrapper ifAbsent: [ self error: 'Please load ProcessWrapper' ])
		ifNotNil: [ :pW | 
			r := pW new
				useStdout;
				startWithShellCommand:
						self gitCommand , ' -C "' , (MCFileTreeFileUtils current directoryPathString: aDirectory) , '" ' , aCommandString;
				upToEnd ].
	^ r