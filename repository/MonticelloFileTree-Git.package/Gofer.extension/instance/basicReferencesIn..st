*monticellofiletree-git-overrides
basicReferencesIn: aRepository
	^ [ aRepository goferReferences asArray ] 
		on: GoferRepositoryError
		do: errorBlock