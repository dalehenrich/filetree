
!MCFileTreeRepository methodsFor: 'actions'!
versionInfoForPackageDirectory: packageDirectory
	^ (MCFileTreeReader on: packageDirectory containingDirectory fileName: packageDirectory localName)
		loadVersionInfo;
		info! !
