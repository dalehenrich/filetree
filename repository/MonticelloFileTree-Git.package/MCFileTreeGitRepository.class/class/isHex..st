private
isHex: aCharacter
	"self isHex: $)"

	aCharacter isDigit
		ifTrue: [ ^ true ].
	^ 'abcdefABCDEF' includes: aCharacter