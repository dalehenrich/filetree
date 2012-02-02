
!MCFileTreeRepository methodsFor: '*monticellofiletree-gemstone-extensions' stamp: 'revelations 11/2/2011 13:07'!
versionReaderForFileNamed: aString do: aBlock
	^ self
		readStreamForFileNamed: aString
		do: [ :s | (MCVersionReader readerClassForFileNamed: aString) ifNotNil: [ :class | aBlock value: (class on: s fileName: aString) ] ]! !
