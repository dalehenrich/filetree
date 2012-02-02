
!MCMczReader methodsFor: '*monticellofiletree-core' stamp: 'OttoBehrens 10/25/2011 01:12'!
extractDefinitionsFromFile: file named: fileName
	(MCSnapshotReader readerClassForFileNamed: fileName)
		ifNotNil: [ :rc | 
			| reader |
			reader := rc on: file text.
			definitions addAll: reader definitions ]! !
