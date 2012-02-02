
!MCVersionInfo methodsFor: '*monticellofiletree-core' stamp: 'revelations 11/3/2011 12:27'!
versionNumber
	^ ((self name copyAfterLast: $-) copyAfter: $.) asInteger ifNil: [ 0 ]! !
