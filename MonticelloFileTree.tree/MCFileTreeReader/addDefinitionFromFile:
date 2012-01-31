
!MCFileTreeReader methodsFor: 'utilities' stamp: 'ezra 11/1/2011 17:57'!
addDefinitionFromFile: directoryEntry
	| defs reader |
	directoryEntry ifNil: [ ^ #() ].
	directoryEntry
		readStreamDo: [ :fileStream | 
			reader := MCStReader on: fileStream.
			(defs := reader definitions) size <= 1
				ifFalse: [ 'we are attempting to write exactly 1 definition per file' halt ] ].
	^ definitions addAll: defs
	! !
