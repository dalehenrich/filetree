
!MCFileTreeStWriter methodsFor: 'visiting'!
visitMetaclassDefinition: definition
	self
		writeInDirectoryName: definition className , '_class'
		fileName: definition className
		extension: '.st'
		visit: [ stWriter writeMetaclassDefinition: definition ]! !
