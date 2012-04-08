initialize-release
writeInitializers
	self
		writeInDirectoryName: '.'
		fileName: 'initializers'
		visit: [ 
			stWriter
				writePresentInitializers;
				writeAbsentInitializers ]