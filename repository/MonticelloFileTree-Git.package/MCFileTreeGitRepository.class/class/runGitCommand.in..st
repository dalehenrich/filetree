accessing
runGitCommand: anArrayOfStrings in: aDirectory
	"Dispatch depending on the platform."

	UIManager default
		informUserDuring:
			[ :bar | 
			bar label: self gitCommand , anArrayOfStrings first.
			Smalltalk platform isWin32
				ifTrue:
					[ ^ self
						runProcessWrapperGitCommand: anArrayOfStrings
						in: aDirectory
						inform: bar ]
				ifFalse:
					[ ^ self
						runOSProcessGitCommand: anArrayOfStrings
						in: aDirectory
						inform: bar ] ]