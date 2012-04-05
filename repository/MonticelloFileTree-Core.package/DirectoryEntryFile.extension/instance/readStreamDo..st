*monticellofiletree-core
readStreamDo: aBlock
	^ directory readOnlyFileNamed: self name do: aBlock