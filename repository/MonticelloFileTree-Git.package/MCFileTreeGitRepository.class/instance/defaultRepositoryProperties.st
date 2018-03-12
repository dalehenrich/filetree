accessing-repository
defaultRepositoryProperties
	"Avoid a recursion bug in the superclass."

	^ Dictionary new
		at: 'packageExtension' put: self class defaultPackageExtension;
		at: 'propertyFileExtension' put: self class defaultPropertyFileExtension;
		at: 'Metadata' put: 'false';
		yourself