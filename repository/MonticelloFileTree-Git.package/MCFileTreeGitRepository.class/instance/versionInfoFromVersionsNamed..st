accessing
versionInfoFromVersionsNamed: names
	"Ok this code hides some of the conflict/version upgrade resolution inside the repository. This is plain bad design from Monticello/Metacello."

	"Beware: the default implementation by Monticello is really bad and may answer a wrong version; revert
	to the FileTree behavior and expect a package name, not a version."

	| versions readableFileNames |
	readableFileNames := self readableFileNames.
	^ names
		collect: [ :aString | 
			| packageDirectory |
			packageDirectory := aString , self packageExtension.
			versions := readableFileNames
				select: [ :each | each packageDirectory = packageDirectory ].
			versions isEmpty
				ifTrue: [ nil ]
				ifFalse: [ versions last info ] ]