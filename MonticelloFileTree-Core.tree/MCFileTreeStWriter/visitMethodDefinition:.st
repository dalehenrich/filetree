
!MCFileTreeStWriter methodsFor: 'visiting' stamp: 'dkh 2/1/2012 20:02'!
visitMethodDefinition: definition
	self
		writeInDirectoryName:
			(definition classIsMeta
				ifTrue: [ definition className , '_class' ]
				ifFalse: [ definition className ])
		fileName:
			(definition selector == #/
				ifTrue: [ 'encoded slash' ]
				ifFalse: [ definition selector ])
		extension: '.st'
		visit: [ stWriter visitMethodDefinition: definition ]! !
