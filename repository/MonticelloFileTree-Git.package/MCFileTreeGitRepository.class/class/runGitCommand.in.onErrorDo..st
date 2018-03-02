accessing
runGitCommand: anArrayOfStrings in: aDirectory onErrorDo: aBlock
	"Dispatch depending on the platform."

	UIManager default
		informUserDuring: [ :bar | 
			bar label: self gitCommand , ' ' , anArrayOfStrings first.
			Smalltalk platform isWin32
				ifTrue: [ ^ self
						runProcessWrapperGitCommand: anArrayOfStrings
						in: aDirectory
						onErrorDo: aBlock ]
				ifFalse: [ ((Smalltalk at: #OSSUnixSubprocess ifAbsent: [  ])
						ifNil: [ false ]
						ifNotNil: [ :g | g isClass ])
						ifTrue: [ ^ self
								runOSSubprocessGitCommand: anArrayOfStrings
								in: aDirectory
								onErrorDo: aBlock ]
						ifFalse: [ ^ self
								runOSProcessGitCommand: anArrayOfStrings
								in: aDirectory
								onErrorDo: aBlock ] ] ]