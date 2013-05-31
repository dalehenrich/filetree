as yet unclassified
versionFromFileNamed: aString
	(aString endsWith: self packageExtension)
		ifTrue: [ ^ super loadVersionFromFileNamed: aString ]
		ifFalse: [ ^ super loadVersionFromFileNamed: (self class parseName: aString) first , self packageExtension ]