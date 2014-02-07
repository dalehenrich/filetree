*MonticelloFileTree-Git-override
createRepository: aRepositorySpec
	| type |
	type := aRepositorySpec type.
	type = 'gitfiletree'
		ifTrue: [ ^ MCFileTreeGitRepository fromZnUrl: aRepositorySpec description asZnUrl ].
	type = 'ftp'
		ifTrue: [ 
			| description headerSize index host directory |
			description := aRepositorySpec description.
			headerSize := 'ftp://' size.
			index := description indexOf: $/ startingAt: headerSize + 1.
			host := description copyFrom: headerSize + 1 to: index - 1.
			directory := description copyFrom: index + 1 to: description size.
			^ MCFtpRepository
				host: host
				directory: directory
				user: aRepositorySpec username
				password: aRepositorySpec password ].
	^ super createRepository: aRepositorySpec