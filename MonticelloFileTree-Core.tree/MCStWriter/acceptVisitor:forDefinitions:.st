
!MCStWriter methodsFor: '*monticellofiletree-core' stamp: 'ezra 10/26/2011 17:33'!
acceptVisitor: aVisitor forDefinitions: aCollection
	(MCDependencySorter sortItems: aCollection)
		do: [ :ea | ea accept: aVisitor ]
		displayingProgress: 'Writing definitions...'! !
