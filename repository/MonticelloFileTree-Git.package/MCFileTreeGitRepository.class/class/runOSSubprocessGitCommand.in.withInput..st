private-commands
runOSSubprocessGitCommand: anArrayOfStrings in: aDirectory withInput: aByteArray
	"A shot in the dark. Reimplementing stuff."

	| classOfOSSUnixSubprocess c retrievedStdout retrievedStderr |
	classOfOSSUnixSubprocess := Smalltalk at: #OSSUnixSubprocess.
	retrievedStdout := String new writeStream.
	retrievedStderr := String new writeStream.
	c := classOfOSSUnixSubprocess new
		command: self gitCommand;
		arguments:
			{'-C'.
			(MCFileTreeFileUtils current directoryPathString: aDirectory)}
				, anArrayOfStrings;
		redirectStdout;
		redirectStderr;
		redirectStdin;
		yourself.
	c run.
	c stdinStream
		binary;
		nextPutAll: aByteArray;
		close.
	c
		waitForExitPollingEvery: (Delay forMilliseconds: 5)
		doing: [ c
				retrieveWhatIsAvailableOn: c stdoutStream
				andAddItTo: retrievedStdout.
			c
				retrieveWhatIsAvailableOn: c stderrStream
				andAddItTo: retrievedStderr ].
	c closeAndCleanStreams.
	c isSuccess
		ifTrue: [ ^ retrievedStdout contents ]
		ifFalse: [ retrievedStderr isEmpty
				ifTrue: [ ^ '' ]
				ifFalse: [ MCFileTreeGitError new
						signal: 'Git error: ' , retrievedStderr contents ] ]