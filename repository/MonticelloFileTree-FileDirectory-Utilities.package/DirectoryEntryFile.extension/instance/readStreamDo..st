*monticellofiletree-filedirectory-utilities
readStreamDo: aBlock
	^ directory readOnlyFileNamed: self name do: aBlock