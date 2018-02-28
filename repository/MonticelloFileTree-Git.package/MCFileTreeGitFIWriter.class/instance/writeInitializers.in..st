private-writing
writeInitializers: anArrayOfMCMethodDefinition in: aPathAsString
	| present absent orderedClasses contents |
	present := Set new.
	absent := Set new.
	anArrayOfMCMethodDefinition
		do: [ :e | 
			e isInitializer
				ifTrue: [ (Smalltalk hasClassNamed: e className)
						ifTrue: [ present add: e ]
						ifFalse: [ absent add: e ] ] ].
	orderedClasses := Class
		superclassOrder:
			(present
				collect: [ :each | Smalltalk classOrTraitNamed: each className ]).
	contents := String
		streamContents: [ :s | 
			orderedClasses
				do: [ :aClass | 
					s
						nextPutAll:
							aClass name , ' '
								, (present detect: [ :m | m className = aClass name ]) selector
								, '.';
						nextPut: Character lf ].
			absent
				do: [ :e | 
					s
						nextPutAll: e className , ' ' , e selector , '.';
						nextPut: Character lf ] ].
	self
		outputFileModify: aPathAsString , '/monticello.meta/initializers.st'
		with: contents