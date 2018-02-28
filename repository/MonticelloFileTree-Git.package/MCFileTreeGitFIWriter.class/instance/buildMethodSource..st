private-converting
buildMethodSource: aMCMethodDefinition
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: aMCMethodDefinition protocol utf8Encoded asString;
				nextPut: Character lf;
				nextPutAll: aMCMethodDefinition source withUnixLineEndings utf8Encoded asString ]