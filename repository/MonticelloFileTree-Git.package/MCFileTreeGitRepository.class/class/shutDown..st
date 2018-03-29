session-handlers
shutDown: aBoolean
	(MCRepositoryGroup default repositories
		select: [ :e | e isKindOf: MCFileTreeGitRepository ])
		do: [ :each | each releaseCaches ]