*MonticelloFileTree-Git
createRepository: aRepositorySpec
	aRepositorySpec description asZnUrl scheme = #gitfiletree
		ifTrue: [ ^ (Smalltalk at: #MCFileTreeGitRepository)
				basicFromUrl: aRepositorySpec description asZnUrl ].
	^ super createRepository: aRepositorySpec