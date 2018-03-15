testing
writeRepositoryProperties
	self fileUtils
		writeStreamFor: '.filetree'
		in: self directory
		do: [ :fileStream | 
			| stringStream keyCount propertyCount |
			stringStream := WriteStream on: String new.
			repositoryProperties
				ifNil: [ repositoryProperties := self defaultRepositoryProperties ].
			keyCount := repositoryProperties size.
			propertyCount := 0.
			stringStream nextPutAll: '{'.
			repositoryProperties
				keysAndValuesDo: [ :propertyName :propertyValue | 
					propertyCount := propertyCount + 1.
					stringStream
						nextPut: $";
						nextPutAll: propertyName asString;
						nextPutAll: '" : "';
						nextPutAll: propertyValue asString;
						nextPut: $";
						yourself.
					propertyCount < keyCount
						ifTrue: [ stringStream
								nextPutAll: ',';
								cr ] ].
			stringStream nextPutAll: ' }'.
			fileStream nextPutAll: stringStream contents withUnixLineEndings ]