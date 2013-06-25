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
	c := PipeableOSProcess command: 'cd ' , fileDirectory pathString , '; git log --pretty="%H" ' , methodFile.
	commitIDs := ReadStream on: c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs contents substrings