accessing
runGitCommand: anArrayOfStrings in: aDirectory withInput: aString
	"Dispatch depending on the platform."

	UIManager default
		informUserDuring: [ :bar | 
			bar label: self gitCommand , ' ' , anArrayOfStrings first.
			Smalltalk platform isWin32
				ifTrue: [ ^ self
						runProcessWrapperGitCommand: anArrayOfStrings
						in: aDirectory
						withInput: aString ]
				ifFalse: [ ((Smalltalk at: #OSSUnixSubprocess ifAbsent: [  ])
						ifNil: [ false ]
						ifNotNil: [ :g | g isClass ])
						ifTrue: [ ^ self
								runOSSubprocessGitCommand: anArrayOfStrings
								in: aDirectory
								withInput: aString ]
						ifFalse: [ ^ self
								runOSProcessGitCommand: anArrayOfStrings
								in: aDirectory
								withInput: aString ] ] ]