
!MCFileTreeWriter methodsFor: 'visiting'!
writeVersion: aVersion
	directory := (MCFileTreeRepository parseName: aVersion info name) last.
	self packageFileDirectory exists
		ifTrue: [ self packageFileDirectory recursiveDelete ].
	self packageFileDirectory assureExistence.
	self initializePackageFileDirectoryCache.
	super writeVersion: aVersion! !
