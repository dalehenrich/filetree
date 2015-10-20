accessing
runGitCommand: anArrayOfStrings in: aDirectory
	"Dispatch depending on the platform."

	Smalltalk platform isWin32
		ifTrue: [ ^ self runProcessWrapperGitCommand: anArrayOfStrings in: aDirectory ]
		ifFalse: [ ^ self runOSProcessGitCommand: anArrayOfStrings in: aDirectory ]