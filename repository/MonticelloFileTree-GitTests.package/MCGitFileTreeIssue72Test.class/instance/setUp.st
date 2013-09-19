resources
setUp
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory c |
	super setUp.
	directory := utilityClass default.
	self assert: directory isWritable.
	c := PipeableOSProcess command: 'cd ' , (utilityClass directoryPathString: directory) , '; git status'.
	c output.
	self assert: c succeeded not