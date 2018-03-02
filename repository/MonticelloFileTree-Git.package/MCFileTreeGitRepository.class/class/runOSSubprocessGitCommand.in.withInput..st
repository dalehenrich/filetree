private-commands
runOSSubprocessGitCommand: anArrayOfStrings in: aDirectory withInput: aByteArray
	| classOfOSSUnixSubprocess file |
	classOfOSSUnixSubprocess := Smalltalk at: #OSSUnixSubprocess.
	(file := FileReference newTempFilePrefix: 'GitCommand' suffix: '.txt')
		writeStreamDo: [ :s | 
			s binary.
			s nextPutAll: aByteArray ].
	classOfOSSUnixSubprocess new
		command: self gitCommand;
		arguments:
			{'-C'.
			(MCFileTreeFileUtils current directoryPathString: aDirectory)}
				, anArrayOfStrings
				,
					{'<'.
					(MCFileTreeFileUtils current directoryPathString: file)};
		redirectStdout;
		redirectStderr;
		runAndWaitPollingEvery: (Delay forMilliseconds: 5)
			retrievingStreams: true
			onExitDo: [ :command :outString :errString | 
			file ensureDelete.
			command isSuccess
				ifTrue: [ ^ outString ]
				ifFalse: [ errString isEmpty
						ifTrue: [ ^ '' ]
						ifFalse: [ MCFileTreeGitError new signal: 'Git error: ' , errString ] ] ]