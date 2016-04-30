accessing
customProjectAttributes
	Smalltalk os isMacOS
		ifTrue: [ (Smalltalk at: #PipeableOSProcess ifAbsent: [  ])
				ifNil: [ ^ #(#MacOSSubprocess) ]
				ifNotNil: [ ^ #(#MacOSProcess) ] ].
	Smalltalk os isUnix
		ifTrue: [ ^ (Smalltalk at: #PipeableOSProcess ifAbsent: [  ])
				ifNil: [ ^ #(#UnixOSSubprocess) ]
				ifNotNil: [ ^ #(#UnixOSProcess) ] ].
	Smalltalk os isWindows
		ifTrue: [ ^ #(#Windows) ]