git querying
gitCloneRepositoryAndCheckoutIn: aDirectoryName
	"Do a clone on the remote repository and do a checkout on it to get the right branch. Complement the directory as well with the working directory. Note the name change when the directory is read-only: this is to protect of a Metacello problem when loading from a configuration with both a read-only and a read-write target (do I also need to protect when dealing with branches?)."

	"Metacello issues: even when selecting a specific version, will I load all repositories?"

	| c targetDir targetDirName |
	targetDirName := readonly
		ifTrue: [ aDirectoryName , '-readonly' ]
		ifFalse: [ aDirectoryName ].
	targetDir := FileSystem workingDirectory / targetDirName.
	targetDir exists
		ifTrue: [ 
			self
				error:
					'GitFileTree target directory already exists, cancelling clone and repository instanciation : ' , targetDir pathString ].
	c := PipeableOSProcess
		command:
			'cd ' , FileSystem workingDirectory pathString , '; git clone ' , (branch ifNil: [ '' ] ifNotNil: [ '-b ' , branch ])
				,
					(readonly
						ifTrue: [ ' --depth 1 ' ]
						ifFalse: [ ' ' ]) , remoteUrl , ' ' , targetDirName.
	c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	GrowlMorph openWithLabel: 'gitfiletree://' contents: 'Cloning remote repository: done!'.
	self
		directory:
			(subdirectory isNil
				ifTrue: [ targetDir ]
				ifFalse: [ targetDir / subdirectory ])