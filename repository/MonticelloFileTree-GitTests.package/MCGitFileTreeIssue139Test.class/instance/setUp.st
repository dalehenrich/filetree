resources
setUp
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory c |
	super setUp.
	directory := utilityClass default.
	self assert: directory isWritable.
	c := PipeableOSProcess command: 'git -C "' , (utilityClass directoryPathString: directory) , '" status'.
	c output.
	self assert: c succeeded not