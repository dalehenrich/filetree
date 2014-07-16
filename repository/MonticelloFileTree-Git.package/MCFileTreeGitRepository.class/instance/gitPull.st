git querying
gitPull
	"Do a pull --rebase on the repository."

	"The pull may fail because this amounts to a merge and rebase (after having done a fetch) and hence may end up in conflicts, that the user will have to solve by hand. Perspectives are that with a merge-tool written in Pharo, we will be able to fall back to Pharo to resolve the conflict, which should be very cool."

	| c |
	[ 
	c := PipeableOSProcess command: 'cd "' , (self fileUtils directoryPathString: directory) , '"; git pull --rebase'.
	c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ] ]
		ensure: [ c closePipes ]