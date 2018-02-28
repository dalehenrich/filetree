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
					(s2 includes: selector first)
						ifFalse: [ selector ]
						ifTrue: [ | output |
							output := String new writeStream.
							output nextPut: $^.
							selector
								do: [ :each | 
									output
										nextPutAll:
											((s2 includes: each)
												ifTrue: [ s2 at: each ]
												ifFalse: [ each asString ]) ]
								separatedBy: [ output nextPut: $. ].
							output contents ] ] ]