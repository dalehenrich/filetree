git querying
gitVersionsForDefinition: aMCDefinition in: aPackageName
	"Query git for all the versions related to that method definition."

	| c commitIDs fileDirectory methodFile |
	fileDirectory := self fileUtils
		directoryFromPath:
			aMCDefinition class name
				,
					(aMCDefinition isExtensionMethod
						ifTrue: [ '.extension' ]
						ifFalse: [ ^ '.class' ])
		relativeTo: (self fileUtils directoryFromPath: aPackageName , '.package' relativeTo: directory).
	methodFile := self fileUtils
		directoryFromPath: (MCFileTreeStCypressWriter new fileNameForSelector: aMCDefinition selector)
		relativeTo:
			(aMCDefinition classIsMeta
				ifTrue: [ 'class' ]
				ifFalse: [ 'instance' ]) asFileReference.
	c := PipeableOSProcess
		command:
			'cd ' , fileDirectory pathString , '; for i in `git log --pretty="%H" ' , methodFile pathString , '`; do echo "'
				, self tag , '"; echo $i; echo "' , self tag , '"; echo `git show $i:./version`; done'.
	commitIDs := ReadStream on: c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs