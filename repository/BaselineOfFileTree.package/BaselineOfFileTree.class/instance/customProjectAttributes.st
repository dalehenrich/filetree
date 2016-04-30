accessing
customProjectAttributes
	Smalltalk os isMacOS
		ifTrue: [ (Smalltalk at: #PipeableOSProcess ifAbsent: [  ])
				ifNil: [ (Smalltalk at: #OSSUnixSubprocess ifAbsent: [  ])
						ifNil: [ ^ #(#MacOSSubprocess) ]
						ifNotNil: [ ^ #(#MacOS) ] ]
				ifNotNil: [ ^ #(#MacOS) ] ].
	Smalltalk os isUnix
		ifTrue: [ ^ (Smalltalk at: #PipeableOSProcess ifAbsent: [  ])
				ifNil: [ (Smalltalk at: #OSSUnixSubprocess ifAbsent: [  ])
						ifNil: [ ^ #(#UnixOSSubprocess) ]
						ifNotNil: [ ^ #(#UnixOS) ] ]
				ifNotNil: [ ^ #(#UnixOS) ] ].
	Smalltalk os isWindows
		ifTrue: [ ^ #(#Windows) ]