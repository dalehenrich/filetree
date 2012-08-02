utilities
addClassAndMethodDefinitionsFromDirectoryEntries: entries
	| timestamp |
	
	self noMethodMetaData
		ifTrue: [ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
		
	entries
		select: [ :entry| entry isDirectory ]
        	thenDo: [ :element | 
                   self addClassAndMethodDefinitionsFromDirectory: element asFileReference timestamp:  timestamp ]