private-converting
buildMethodSource: aMCMethodDefinition
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: aMCMethodDefinition protocol;
				nextPut: Character lf;
				nextPutAll: aMCMethodDefinition source withUnixLineEndings ]
