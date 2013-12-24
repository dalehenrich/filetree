*monticellofiletree-core
cypressEscapeCharacter: aCharacter

	^ ('\' includes: aCharacter)
		ifTrue: [ '\', aCharacter asString ] 
		ifFalse: [ aCharacter asString ]