accessing
fossilCommand
	"Preferences for Squeak as well."

	"Platform determination is probably Pharo-specific."

	<preference: 'Fossil Command Path' category: 'monticello'
	description:
		'The complete path for the fossil command, if not in the default PATH and different in name'
	type: #String>
	^ FossilCommand
		ifNil: [ Smalltalk os isWindows
				ifTrue: [ 'fossil' ]
				ifFalse: [ '/us/bin/fossil' ] ]