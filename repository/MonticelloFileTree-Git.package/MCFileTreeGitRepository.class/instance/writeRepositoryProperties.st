as yet unclassified
writeRepositoryProperties
	| c |
	super writeRepositoryProperties.
	c := PipeableOSProcess
		command: 'cd ' , directory pathString , '; git add .filetree; git commit -m "gitfiletree repository properties" -- .filetree'.
	c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ]