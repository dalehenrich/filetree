accessing
zipForDefinition: aMCDefinition
	"We suppose we are trying to load a specific method definition. Recover the relevant archive as needed."

	"Ask in the archive, the method file, and the two properties file."

	| c classDirectory methodFile methodPropertiesFile classPropertiesFile |
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
	methodPropertiesFile := classDirectory , self slash , 'methodProperties.json'.
	classPropertiesFile := classDirectory , self slash , 'properties.json'.
	c := PipeableOSProcess
		command:
			'cd ' , stream pathString , '; git archive --format=zip ' , commitID , ' ' , methodFile , ' ' , methodPropertiesFile
				, ' ' , classPropertiesFile.
	zip readFrom: (ReadStream on: c output asByteArray).
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ zip