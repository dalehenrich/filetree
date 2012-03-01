
!MCFileTreeAbstractReader methodsFor: 'utilities'!
parseMember: fileName
	| tokens contents |
	contents := packageDirectory fileNamed: fileName do: [ :file | file contents ].
	tokens := (self scanner scanTokens: contents) first.
	^ self associate: tokens! !
