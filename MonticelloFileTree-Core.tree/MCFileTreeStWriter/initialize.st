
!MCFileTreeStWriter methodsFor: 'initialize-release' stamp: 'ezra 10/26/2011 17:16'!
initialize
	stWriter := (MCStWriter new)
		initializers: (initializers := Set new);
		yourself.
	orderedClassNames := OrderedCollection new! !
