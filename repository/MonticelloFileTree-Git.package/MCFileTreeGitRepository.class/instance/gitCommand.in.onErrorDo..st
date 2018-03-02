private
gitCommand: aCommandString in: aDirectory onErrorDo: aBlock
	^ self class
		runGitCommand: aCommandString
		in: aDirectory
		onErrorDo: aBlock