accessing-repository
packageExtension
	"Protect against a recursion bug on repository properties"

	^ (repositoryProperties
		ifNotNil: [ :p | p at: 'packageExtension' ifAbsent: [  ] ])
		ifNil: [ '.package' ]