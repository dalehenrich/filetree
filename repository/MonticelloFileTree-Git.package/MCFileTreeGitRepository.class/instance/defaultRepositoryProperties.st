accessing-metadata
defaultRepositoryProperties
	^ super defaultRepositoryProperties
		at: 'Metadata' put: 'true';
		yourself