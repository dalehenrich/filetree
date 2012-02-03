
!MCVersionInfo methodsFor: '*monticellofiletree-core'!
versionNumber
	^ ((self name copyAfterLast: $-) copyAfter: $.) asInteger ifNil: [ 0 ]! !
