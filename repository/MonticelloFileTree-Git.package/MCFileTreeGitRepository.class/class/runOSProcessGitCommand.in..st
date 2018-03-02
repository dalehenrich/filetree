private-commands
runOSProcessGitCommand: anArrayOfStrings in: aDirectory
	^ self
		runOSProcessGitCommand: anArrayOfStrings
		in: aDirectory
		onErrorDo:
			[ :errorString | MCFileTreeGitError new signal: 'Git error: ' , errorString ]