session-handlers
shutDown: aBoolean
	(MCRepositoryGroup default repositories
		select: [ :e | e isKindOf: MCFileTreeFossilRepository ])
		do: [ :each | each releaseCaches ]