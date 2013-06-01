as yet unclassified
version
	^ version
		ifNil: [ 
			Cursor wait showWhile: [ version := (versions detect: [ :e | e last name = selectedVersion ]) last info ].
			version ]