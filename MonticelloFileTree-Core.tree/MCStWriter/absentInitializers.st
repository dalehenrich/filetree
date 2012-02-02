
!MCStWriter methodsFor: '*monticellofiletree-core' stamp: 'ezra 10/26/2011 17:25'!
absentInitializers
	^ initializers reject: [ :each | Smalltalk hasClassNamed: each key ]! !
