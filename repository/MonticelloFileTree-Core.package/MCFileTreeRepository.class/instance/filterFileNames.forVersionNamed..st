as yet unclassified
filterFileNames: aCollection forVersionNamed: aString
  ^ self withMonticelloMetadata
    ifTrue: [ super filterFileNames: aCollection forVersionNamed: aString ]
    ifFalse: [ 
      | ar baseVersionName |
      ar := self parseName: aString extension: ''.
      baseVersionName := ar at: 1.
      aCollection
        select: [ :packageDirectoryName | 
          | packageName |
          packageName := packageDirectoryName
            copyFrom: 1
            to: (packageDirectoryName lastIndexOf: $.) - 1.
          baseVersionName = packageName ] ]