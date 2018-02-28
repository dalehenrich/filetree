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
	orderedClasses := (Class
		superclassOrder:
			(present
				collect: [ :each | Smalltalk classOrTraitNamed: each className ]))
		collect: [ :e | e className ].
	contents := String
		streamContents: [ :s | 
			orderedClasses
				do: [ :aClassName | 
					s
						nextPutAll:
							aClassName , ' '
								, (present detect: [ :m | m className = aClassName ]) selector
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