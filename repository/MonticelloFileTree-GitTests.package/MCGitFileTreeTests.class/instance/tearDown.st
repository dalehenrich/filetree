resources
tearDown
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory writeTempDir |
	super tearDown.
	directory := self utilityClass default.
	writeTempDir := self utilityClass directoryFromPath: 'temp' relativeTo: directory.
	(self utilityClass directoryExists: writeTempDir)
		ifTrue: [ self utilityClass deleteAll: writeTempDir ].
	self assert: (self utilityClass directoryExists: writeTempDir) not