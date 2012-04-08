visiting
visitMetaclassDefinition: definition
	self
		writeInDirectoryName: definition className , '_class'
		fileName: definition className
		visit: [ stWriter writeMetaclassDefinition: definition ]