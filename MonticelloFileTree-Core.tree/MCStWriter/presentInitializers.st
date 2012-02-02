
!MCStWriter methodsFor: '*monticellofiletree-core' stamp: 'ezra 10/26/2011 17:19'!
presentInitializers
	^ initializers select: [ :each | Smalltalk hasClassNamed: each key ]! !
