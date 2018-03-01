private
baseFileNameForSelector: selector
	^ (selector includes: $:)
		ifTrue: [ selector
				collect: [ :each | 
					each = $:
						ifTrue: [ $. ]
						ifFalse: [ each ] ] ]
		ifFalse: [ self specials
				in: [ :s2 | 
					(s2 includesKey: selector first)
						ifFalse: [ selector ]
						ifTrue: [ String
								streamContents: [ :output | 
									output nextPut: $^.
									selector
										do:
											[ :each | output nextPutAll: (s2 at: each ifAbsent: [ each asString ]) ]
										separatedBy: [ output nextPut: $. ] ] ] ] ]