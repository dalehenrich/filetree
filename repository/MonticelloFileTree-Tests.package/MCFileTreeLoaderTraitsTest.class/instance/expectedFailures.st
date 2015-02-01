testing
expectedFailures
	| versionString |
	Smalltalk
		at: #SystemVersion
		ifPresent: [ :cl | 
			versionString := cl current version.
			versionString = 'Pharo3.0'
				ifTrue: [ ^ #(#testLoad) ] ].
	^ super expectedFailures