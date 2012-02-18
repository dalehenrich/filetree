
!MCMczReader methodsFor: '*monticellofiletree-core'!
extractDefinitionsFromFile: file named: fileName
	(MCSnapshotReader readerClassForFileNamed: fileName)
		ifNotNil: [ :rc | 
			| reader |
			reader := rc on: file text.
			definitions addAll: reader definitions ]! !
