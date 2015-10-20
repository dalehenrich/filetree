tests
writeRepositoryProperties: repositoryProperties in: aDirectory
	self utilityClass
		writeStreamFor: '.filetree'
		in: aDirectory
		do: [ :fileStream | 
			| keyCount propertyCount |
			keyCount := repositoryProperties size.
			propertyCount := 0.
			fileStream nextPutAll: '{'.
			repositoryProperties
				keysAndValuesDo: [ :propertyName :propertyValue | 
					propertyCount := propertyCount + 1.
					fileStream
						nextPut: $";
						nextPutAll: propertyName asString;
						nextPutAll: '" : "';
						nextPutAll: propertyValue asString;
						nextPut: $";
						yourself.
					propertyCount < keyCount
						ifTrue: [ 
							fileStream
								nextPutAll: ',';
								lf ] ].
			fileStream nextPutAll: ' }' ]