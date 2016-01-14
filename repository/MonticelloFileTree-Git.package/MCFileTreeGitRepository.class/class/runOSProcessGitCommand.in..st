private-commands
runOSProcessGitCommand: anArrayOfStrings in: aDirectory
	OSSUnixSubprocess new
		command: self gitCommand;
		arguments:
			{'-C'.
			(MCFileTreeFileUtils current directoryPathString: aDirectory)}
				, anArrayOfStrings;
		createAndSetStdoutStream;
		createAndSetStderrStream;
		runAndWaitPollingEvery: (Delay forMilliseconds: 5)
			retrievingStreams: true
			onExitDo:
				[ :command :outString :errString | 
			command isSuccess
				ifTrue: [ ^ outString ]
				ifFalse:
					[ errString isEmpty
						ifTrue: [ ^ '' ]
						ifFalse: [ MCFileTreeGitError new
								signal: 'Git error: ' , errString ] ] ]
	
