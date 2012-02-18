
!MCStWriter methodsFor: '*monticellofiletree-core'!
presentInitializers
	^ initializers select: [ :each | Smalltalk hasClassNamed: each key ]! !
