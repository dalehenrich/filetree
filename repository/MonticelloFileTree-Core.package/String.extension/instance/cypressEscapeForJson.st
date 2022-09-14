*monticellofiletree-core
cypressEscapeForJson

	| specials output |
	specials := MCFileTreeJsonParser stringSpecials.
	output := String new writeStream.
	self do: [:each |
		(specials at: each asciiValue + 1 ifAbsent: [])
			ifNotNil: [:escape | output nextPutAll: escape asString]
			ifNil: [output nextPut: each]].
	^ output contents