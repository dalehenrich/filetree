
!MCFileTreeRepository methodsFor: 'actions' stamp: 'dkh 1/31/2012 14:14'!
packageDescriptionFromPackageDirectory: packageDirectory
    | info |
    info := self versionInfoForPackageDirectory: packageDirectory.
    ^ self parseName: info name! !
