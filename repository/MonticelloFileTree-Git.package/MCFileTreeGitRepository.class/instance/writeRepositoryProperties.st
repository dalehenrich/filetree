i/o
writeRepositoryProperties
	"When writing the repository properties, commit them as well."

	| c s |
	super writeRepositoryProperties.
	c := PipeableOSProcess
		command:
			'cd "' , (self fileUtils directoryPathString: directory) , '"; git add .filetree; git commit -m "gitfiletree repository properties" -- .filetree'.
	s := c output.
	c succeeded
		ifFalse: [ 
			| serr |
			serr := c errorPipelineContents.
			serr notEmpty
				ifTrue: [ self error: 'Git error: ' , serr , ': ' , s ] ]