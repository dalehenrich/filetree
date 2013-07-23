resources
tearDown
	"Test for the context. We need: a writeable directory, not handled by git."

	| directory c |
	directory := FileSystem disk workingDirectory.
	self assert: directory isWritable.
	c := PipeableOSProcess command: 'cd ' , directory pathString , '; rm -rf temp'.
	c output.
	self assert: (directory / 'temp') exists not