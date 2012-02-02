
!MCFileTreeWriter methodsFor: 'visiting' stamp: 'dkh 1/30/2012 20:57'!
writeVersion: aVersion
	directory := (MCFileTreeRepository parseName: aVersion info name) last.
	self packageFileDirectory exists
		ifTrue: [ self packageFileDirectory recursiveDelete ].
	self packageFileDirectory assureExistence.
	self initializePackageFileDirectoryCache.
	super writeVersion: aVersion! !
