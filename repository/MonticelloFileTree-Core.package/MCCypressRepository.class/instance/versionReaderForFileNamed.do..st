actions
versionReaderForFileNamed: aString do: aBlock
	^ self
		readStreamForFileNamed: aString
		do: [:s | aBlock value: (MCFileTreeReader on: s fileName: aString)]
