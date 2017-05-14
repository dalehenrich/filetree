instance creation
parseName: aString extension: extension
	"picked up from GoferVersionReference>>#parseName:"

	"self parseName: 'MonticelloFileTree-Git-ThierryGoubier.ccb44fb'"

	| basicName package branch author versionNumber packageName |
	basicName := (aString last digitValue between: 0 and: 15)
		ifTrue: [ aString ]
		ifFalse: [ (aString copyUpToLast: $.) copyUpTo: $( ].
	package := basicName copyUpToLast: $-.
	(package includes: $.)
		ifFalse: [ branch := '' ]
		ifTrue: [ branch := '.' , (package copyAfter: $.).
			package := package copyUpTo: $. ].
	author := (basicName copyAfterLast: $-) copyUpToLast: $..
	versionNumber := (basicName copyAfterLast: $-) copyAfterLast: $..
	(versionNumber notEmpty
		and: [ versionNumber allSatisfy: [ :each | self isDigit: each ] ])
		ifFalse: [ versionNumber := 0 ].
	packageName := package , branch.
	^ {packageName.
	author.
	versionNumber.
	basicName}