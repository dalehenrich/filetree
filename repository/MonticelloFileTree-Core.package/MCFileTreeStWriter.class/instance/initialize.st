initialize-release
initialize
	stWriter := (MCStWriter new)
		initializers: (initializers := Set new);
		yourself.
	orderedClassNames := OrderedCollection new