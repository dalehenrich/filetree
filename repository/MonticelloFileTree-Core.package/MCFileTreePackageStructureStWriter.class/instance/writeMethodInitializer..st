writing
writeMethodInitializer: aMethodDefinition

	| initializationStream |
	
	aMethodDefinition isInitializer 
		ifTrue: [
			initializationStream := String new writeStream.			
			initializationStream nextChunkPut: aMethodDefinition className, ' initialize'; cr.
			initializers add: (aMethodDefinition className->initializationStream)].