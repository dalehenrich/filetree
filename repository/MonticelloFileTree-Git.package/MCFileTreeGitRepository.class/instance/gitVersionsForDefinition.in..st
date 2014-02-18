git querying
gitVersionsForDefinition: aMCDefinition in: aPackageName
	"Query git for all the versions related to that method definition."

	| c commitIDs fileDirectory methodFile |
	fileDirectory := self fileUtils
		directoryFromPath:
			aMCDefinition className
				,
					(aMCDefinition isExtensionMethod
						ifTrue: [ '.extension' ]
						ifFalse: [ '.class' ])
		relativeTo: (self fileUtils directoryFromPath: aPackageName , '.package' relativeTo: directory).
	methodFile := (aMCDefinition classIsMeta
		ifTrue: [ 'class' ]
		ifFalse: [ 'instance' ]) , '/' , (MCFileTreeStCypressWriter new fileNameForSelector: aMCDefinition selector) , '.st'.
	(self fileUtils directoryExists: fileDirectory)
		ifFalse: [ NotFound signalFor: fileDirectory ].
	c := PipeableOSProcess
		command: 'cd ' , (self fileUtils directoryPathString: fileDirectory) , '; git log --format="%H" -- ' , methodFile.
	commitIDs := ReadStream on: c output.
	c succeeded
		ifFalse: [ NotFound signalFor: c errorPipelineContents ].
	^ commitIDs contents substrings collect: [ :e | ByteArray readHexFrom: e ]