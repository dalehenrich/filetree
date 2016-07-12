as yet unclassified
versionReaderForFileNamed: aString do: aBlock
  ^ self
    readStreamForFileNamed: aString
    do: [ :s | 
      (MCVersionReader readerClassForFileNamed: aString)
        ifNotNil: [ :class | 
          | reader |
          reader := class on: s fileName: aString.
          reader withMonticelloMetadata: self withMonticelloMetadata.
          aBlock value: reader ] ]