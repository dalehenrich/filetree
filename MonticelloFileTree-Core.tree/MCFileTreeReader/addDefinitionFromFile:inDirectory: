
!MCFileTreeReader methodsFor: 'utilities' stamp: 'revelations 11/2/2011 13:59'!
addDefinitionFromFile: directoryEntry inDirectory: aDirectory
	| defs reader |
	directoryEntry ifNil: [ ^ #() ].
	aDirectory
		fileNamed: directoryEntry name
		do: [ :fileStream | 
			reader := MCStReader on: fileStream.
			(defs := reader definitions) size <= 1
				ifFalse: [ 'we are attempting to write exactly 1 definition per file' halt ] ].
	^ definitions addAll: defs! !
