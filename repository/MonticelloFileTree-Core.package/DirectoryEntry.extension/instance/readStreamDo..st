*monticellofiletree-core
readStreamDo: aBlock
	^ self sourceDirectory readOnlyFileNamed: self name do: aBlock