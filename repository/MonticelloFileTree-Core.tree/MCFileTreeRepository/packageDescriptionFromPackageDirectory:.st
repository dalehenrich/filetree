
!MCFileTreeRepository methodsFor: 'actions'!
packageDescriptionFromPackageDirectory: packageDirectory
    | info |
    info := self versionInfoForPackageDirectory: packageDirectory.
    ^ self parseName: info name! !
