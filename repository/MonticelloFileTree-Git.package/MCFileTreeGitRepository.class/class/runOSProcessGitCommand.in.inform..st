private-commands
runOSProcessGitCommand: anArrayOfStrings in: aDirectory inform: aBar
	| c r d in out err it |
	it := 0.
	in := ExternalPipe nonBlockingPipe.
	out := ExternalPipe nonBlockingPipe.
	err := ExternalPipe nonBlockingPipe.
	[ c := PipeableOSProcess externalProxyClass
		programName: self gitCommand
		arguments: anArrayOfStrings
		initialEnvironment: nil.
	c initialStdIn: in reader.
	c initialStdOut: out writer.
	c initialStdErr: err writer.
	c pwd: (MCFileTreeFileUtils current directoryPathString: aDirectory).
	c := c initialize value.
	d := nil.
	r := out upToEnd.
	[ c update: #runState.
	c isComplete ]
		whileFalse:
			[ (d ifNil: [ d := Delay forMilliseconds: 5 ]) wait.
			it := (it + 1) // 100.
			aBar current: it.
			r := r , out upToEnd ].
	r := r , out upToEndOfFile.
	c succeeded
		ifFalse:
			[ | errorString |
			errorString := err upToEndOfFile.
			errorString notEmpty
				ifTrue: [ MCFileTreeGitError new
						signal: 'Git error: ' , errorString ].
			r := '' ] ]
		ensure: [ in close.
			out close.
			err close ].
	^ r