constants
baseFileNameForSelector: aSelectorAsSymbol
	^ (aSelectorAsSymbol includes: $:)
		ifTrue: [ aSelectorAsSymbol
				collect: [ :each | 
					each = $:
						ifTrue: [ $. ]
						ifFalse: [ each ] ] ]
		ifFalse: [ self specials
				in: [ :s2 | 
					(s2 includesKey: aSelectorAsSymbol first)
						ifFalse: [ aSelectorAsSymbol ]
						ifTrue: [ String
								streamContents: [ :output | 
									output nextPut: $^.
									aSelectorAsSymbol
										do:
											[ :each | output nextPutAll: (s2 at: each ifAbsent: [ each asString ]) ]
										separatedBy: [ output nextPut: $. ] ] ] ] ]