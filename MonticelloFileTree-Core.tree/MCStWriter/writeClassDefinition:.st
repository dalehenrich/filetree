
!MCStWriter methodsFor: '*monticellofiletree-core'!
writeClassDefinition: definition
	self chunkContents: [ :s | definition printDefinitionOn: s ]! !
