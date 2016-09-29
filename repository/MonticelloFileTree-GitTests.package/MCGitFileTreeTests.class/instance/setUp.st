resources
setUp
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory |
	super setUp.
	directory := self utilityClass default.
	self assert: directory isWritable