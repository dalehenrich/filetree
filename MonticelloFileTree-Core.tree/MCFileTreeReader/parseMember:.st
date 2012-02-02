
!MCFileTreeReader methodsFor: 'utilities' stamp: 'revelations 11/9/2011 11:26'!
parseMember: fileName
	| tokens contents |
	contents := packageDirectory fileNamed: fileName do: [ :file | file contents ].
	tokens := (self scanner scanTokens: contents) first.
	^ self associate: tokens! !
