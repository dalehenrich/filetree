accessing
runGitCommand: aCommandString in: aDirectory
	"Dispatch depending on the platform."

	Smalltalk platform isWin32
		ifTrue: [ ^ self runProcessWrapperGitCommand: aCommandString in: aDirectory ]
		ifFalse: [ ^ self runOSProcessGitCommand: aCommandString in: aDirectory ]