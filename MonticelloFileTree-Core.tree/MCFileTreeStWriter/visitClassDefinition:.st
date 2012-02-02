
!MCFileTreeStWriter methodsFor: 'visiting' stamp: 'dkh 2/1/2012 20:01'!
visitClassDefinition: definition
	orderedClassNames add: definition className.
	self
		writeInDirectoryName: definition className
		fileName: definition className
		extension: '.st'
		visit: [ 
			stWriter writeClassDefinition: definition.
			definition hasClassInstanceVariables
				ifTrue: [ stWriter writeMetaclassDefinition: definition ].
			definition hasComment
				ifTrue: [ stWriter writeClassComment: definition ] ]! !
