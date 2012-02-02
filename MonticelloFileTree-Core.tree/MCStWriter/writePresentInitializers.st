
!MCStWriter methodsFor: '*monticellofiletree-core' stamp: 'ezra 10/26/2011 17:21'!
writePresentInitializers
	| orderedClasses presentInitializers |
	presentInitializers := self presentInitializers.
	orderedClasses := (Class
		superclassOrder: (presentInitializers collect: [ :each | Smalltalk classOrTraitNamed: each key ]))
		collect: [ :each | each name ].
	orderedClasses
		do: [ :className | stream nextPutAll: (presentInitializers detect: [ :each | each key = className ]) value contents ]! !
