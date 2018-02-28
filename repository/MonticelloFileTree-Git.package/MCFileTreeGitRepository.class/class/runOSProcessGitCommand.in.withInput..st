private-commands
runOSProcessGitCommand: anArrayOfStrings in: aDirectory withInput: aString
	| classOfExternalPipe classOfPipeableOSProcess c r d in out err file |
	classOfExternalPipe := Smalltalk at: #ExternalPipe.
	classOfPipeableOSProcess := Smalltalk at: #PipeableOSProcess.
	(file := FileReference newTempFilePrefix: 'GitCommand' suffix: '.txt')
		writeStreamDo: [ :s | s nextPutAll: aString ].
	in := FileStream readOnlyFileNamed: file pathString.
	out := classOfExternalPipe nonBlockingPipe.
	err := classOfExternalPipe nonBlockingPipe.
	[ c := classOfPipeableOSProcess externalProxyClass
		programName: self gitCommand
		arguments: anArrayOfStrings
		initialEnvironment: nil.
	c initialStdIn: in.
	c initialStdOut: out writer.
	c initialStdErr: err writer.
	c pwd: (MCFileTreeFileUtils current directoryPathString: aDirectory).
	c := c initialize value.
	d := nil.
	in close.
	r := out upToEnd.
	[ c update: #runState.
	c isComplete ]
		whileFalse: [ (d ifNil: [ d := Delay forMilliseconds: 5 ]) wait.
			r := r , out upToEnd ].
	r := r , out upToEndOfFile.
	c succeeded
		ifFalse: [ | errorString |
			errorString := err upToEndOfFile.
			errorString notEmpty
				ifTrue: [ MCFileTreeGitError new signal: 'Git error: ' , errorString ].
			r := '' ] ]
		ensure: [ in close.
			out close.
			err close.
			file ensureDelete ].
	^ r