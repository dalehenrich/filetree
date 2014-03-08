accessing
zipForDefinition: aMCDefinition
	"We suppose we are trying to load a specific method definition. Recover the relevant archive as needed."

	"Ask in the archive, the method file, and the class properties file."

	| c output classDirectory methodFile classPropertiesFile |
	self assert: aMCDefinition isMethodDefinition.
	zip := ZipArchive new.
	classDirectory := packageDirectory , self slash , aMCDefinition className
		,
			(aMCDefinition isExtensionMethod
				ifTrue: [ '.extension' ]
				ifFalse: [ '.class' ]).
	methodFile := classDirectory , self slash
		,
			(aMCDefinition classIsMeta
				ifTrue: [ 'class' ]
				ifFalse: [ 'instance' ]) , self slash , (MCFileTreeStCypressWriter new fileNameForSelector: aMCDefinition selector)
		, '.st'.
	classPropertiesFile := classDirectory , self slash , 'properties.json'.
	c := PipeableOSProcess
		command:
			'cd "' , (self fileUtils directoryPathString: stream) , '"; git archive --format=zip ' , commitID hex , ' ' , methodFile
				, ' ' , classPropertiesFile.
	output := c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	zip readFrom: (ReadStream on: output asByteArray).
	^ zip