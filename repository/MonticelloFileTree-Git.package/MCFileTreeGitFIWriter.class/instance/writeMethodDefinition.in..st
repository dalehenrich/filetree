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
		outputFileModify:
			dirName , (self baseFileNameForSelector: aMCMethodDefinition selector)
				, '.st'
		with: (self buildMethodSource: aMCMethodDefinition)