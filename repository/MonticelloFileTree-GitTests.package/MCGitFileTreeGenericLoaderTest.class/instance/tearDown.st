resources
tearDown
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory writeTempDir |
	super tearDown.
	directory := utilityClass default.
	writeTempDir := utilityClass directoryFromPath: self writeTestRepositoryName relativeTo: directory.
	(utilityClass directoryExists: writeTempDir)
		ifTrue: [ utilityClass deleteAll: writeTempDir ].
	self assert: (utilityClass directoryExists: writeTempDir) not