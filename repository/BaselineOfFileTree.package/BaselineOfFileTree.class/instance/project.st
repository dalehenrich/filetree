accessing
project
	| aProject projectAttributes |
	aProject := super project.     
	Smalltalk os isMacOS ifTrue: [ projectAttributes := #( #'MacOS' ) ].
	Smalltalk os isUnix ifTrue: [ projectAttributes := #( #'Unix' ) ].
	Smalltalk os isWindows ifTrue: [ projectAttributes := #( #'Windows' ) ].
	aProject projectAttributes: projectAttributes.
	^ aProject

