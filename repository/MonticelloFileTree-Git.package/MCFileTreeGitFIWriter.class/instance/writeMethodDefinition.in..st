private-writing
writeMethodDefinition: aMCMethodDefinition in: aClassPath
	"Write as one item."

	| dirName |
	dirName := aClassPath
		,
			(aMCMethodDefinition classIsMeta
				ifTrue: [ '/class/' ]
				ifFalse: [ '/instance/' ]).
	self
		outputFileModify: dirName , (self fileNameForSelector: aMCMethodDefinition selector)
		with: (self buildMethodSource: aMCMethodDefinition)