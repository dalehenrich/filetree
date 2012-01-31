
!MCFileTreeRepository methodsFor: 'interface' stamp: 'OttoBehrens 10/26/2011 20:13'!
versionWithInfo: aVersionInfo ifAbsent: errorBlock
	(self allFileNamesForVersionNamed: aVersionInfo name)
		ifNotEmpty: [ :aCollection | ^ self versionFromFileNamed: aCollection first ].
	^ errorBlock value! !
