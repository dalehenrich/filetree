
!MCFileTreeRepository class methodsFor: 'accessing'!
defaultPackageExtension
    ".tree and .pkg are the only two formats supported at the moment.

	default package extension is primary driver fo  format in which package structure is written"

    defaultPackageExtension ifNil: [ defaultPackageExtension := '.tree' ].
    ^ defaultPackageExtension! !
