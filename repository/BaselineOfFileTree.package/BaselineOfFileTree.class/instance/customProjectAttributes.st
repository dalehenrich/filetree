accessing
customProjectAttributes
	Smalltalk os isMacOS
		ifTrue: [ (Smalltalk hasClassNamed: #PipeableOSProcess)
				ifFalse: [ (Smalltalk hasClassNamed: #OSSUnixSubprocess)
						ifFalse: [ ^ #(#MacOSProcess) ]
						ifTrue: [ ^ #(#MacOS) ] ]
				ifTrue: [ ^ #(#MacOS) ] ].
	Smalltalk os isUnix
		ifTrue: [ (Smalltalk hasClassNamed: #PipeableOSProcess)
				ifFalse: [ (Smalltalk hasClassNamed: #OSSUnixSubprocess)
						ifFalse: [ ^ #(#UnixOSProcess) ]
						ifTrue: [ ^ #(#Unix) ] ]
				ifTrue: [ ^ #(#Unix) ] ].
	Smalltalk os isWindows
		ifTrue: [ ^ #(#Windows) ]