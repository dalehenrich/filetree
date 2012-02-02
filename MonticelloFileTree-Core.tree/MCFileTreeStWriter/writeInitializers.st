
!MCFileTreeStWriter methodsFor: 'initialize-release' stamp: 'dkh 2/1/2012 19:55'!
writeInitializers
	self
		writeInDirectoryName: '.'
		fileName: 'initializers'
		extension: '.st'
		visit: [ 
			stWriter
				writePresentInitializers;
				writeAbsentInitializers ] ! !
