
!MCFileTreeRepository class methodsFor: 'accessing'!
defaultPackageExtension: aString
    ".tree and .pkg are the only two formats supported at the moment"

    (#('.tree' '.pkg') includes: aString)
        ifFalse: [ self error: 'Unsupported package extension: ' , aString printString ].
    defaultPackageExtension := aString! !
