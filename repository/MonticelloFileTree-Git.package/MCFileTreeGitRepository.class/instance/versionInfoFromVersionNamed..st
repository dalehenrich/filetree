accessing
versionInfoFromVersionNamed: aString
	"Ok this code hides some of the conflict/version upgrade resolution inside the repository. This is plain bad design from Monticello/Metacello."
	
	"Beware: the default implementation by Monticello is really bad and may answer a wrong version; revert
	to the FileTree behavior and expect a package name, not a version."

	| versions |
	versions := self readableFileNames
		select: [ :each | each packageDirectory = (aString , self packageExtension) ].
	versions isEmpty
		ifTrue: [ ^ nil ].
	versions := versions
		asSortedCollection: [ :a :b | 
			a timeStamp
				<= b timeStamp ].
	^ versions last info