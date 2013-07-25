i/o
writeRepositoryProperties
	| c s |
	super writeRepositoryProperties.
	c := PipeableOSProcess
		command:
			'cd ' , directory pathString , '; git add .filetree; git commit -m "gitfiletree repository properties" -- .filetree'.
	s := c output.
	c succeeded
		ifFalse: [ 
			| serr |
			serr := c errorPipelineContents.
			serr notEmpty
				ifTrue: [ c self error: 'Git error: ' , serr , ': ' , s ] ]