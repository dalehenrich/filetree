
!MCFileTreeStWriter methodsFor: 'visiting' stamp: 'dkh 2/1/2012 20:02'!
visitMetaclassDefinition: definition
	self
		writeInDirectoryName: definition className , '_class'
		fileName: definition className
		extension: '.st'
		visit: [ stWriter writeMetaclassDefinition: definition ]! !
