
!MCFileTreeAbstractStWriter methodsFor: 'initialize-release'!
writeInitializers
	self
		writeInDirectoryName: '.'
		fileName: 'initializers'
		extension: '.st'
		visit: [ 
			stWriter
				writePresentInitializers;
				writeAbsentInitializers ] ! !
