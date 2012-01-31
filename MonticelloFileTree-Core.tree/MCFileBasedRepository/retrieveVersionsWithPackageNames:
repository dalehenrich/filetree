
!MCFileBasedRepository methodsFor: '*monticellofiletree-core' stamp: 'ezra 10/28/2011 18:25'!
retrieveVersionsWithPackageNames: packageNames
	| packageDescriptions |
	packageDescriptions := self packageDescriptionsFromReadableFileNames.
	packageNames addAll: (packageDescriptions collect: [ :packageDescription | packageDescription first ]).
	^ packageDescriptions select: [ :each | (each at: 3) isNumber ]! !
