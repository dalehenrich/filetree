
!MCStWriter methodsFor: '*monticellofiletree-core'!
absentInitializers
	^ initializers reject: [ :each | Smalltalk hasClassNamed: each key ]! !
