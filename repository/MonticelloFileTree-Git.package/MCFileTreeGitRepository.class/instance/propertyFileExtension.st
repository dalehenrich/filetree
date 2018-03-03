accessing-repository
propertyFileExtension
	"Protect against a recursion bug on repository properties"

	^ (repositoryProperties
		ifNotNil: [ :p | p at: 'propertyFileExtension' ifAbsent: [  ] ])
		ifNil: [ self class defaultPropertyFileExtension ]