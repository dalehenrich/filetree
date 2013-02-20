*monticellofiletree-core
superclassOrder: classes
	| co symDict |
	co := ClassOrganizer defaultList: classes.
	symDict := SymbolDictionary new.
	classes do: [:cl | symDict at: cl name put: cl ].
	^co determineClassFileoutOrder: symDict.