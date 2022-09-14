accessing
stringSpecials
	"Opposite of MCFileTreeJsonParser>>#parseCharacter."

    ^ StringSpecials ifNil: [StringSpecials := self initializeStringSpecials]