resources
setUp
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory c |
	directory := FileSystem disk workingDirectory.
	self assert: directory isWritable.
	c := PipeableOSProcess command: 'cd ' , directory pathString , '; git status'.
	c output.
	self assert: c succeeded not.
	super setUp