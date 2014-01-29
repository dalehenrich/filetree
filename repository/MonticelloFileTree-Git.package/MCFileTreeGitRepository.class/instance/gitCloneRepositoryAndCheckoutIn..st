git querying
gitCloneRepositoryAndCheckoutIn: aDirectoryName
	"Do a clone on the remote repository and do a checkout on it to get the right branch. Complement the directory as well with the working directory."

	| c |
	(FileSystem workingDirectory / aDirectoryName) exists
		ifTrue: [ 
			self
				error:
					'GitFileTree target directory already exists, cancelling clone and repository instanciation : '
						, (FileSystem workingDirectory / aDirectoryName) pathString ].
	c := PipeableOSProcess
		command:
			'cd ' , FileSystem workingDirectory pathString , '; git clone ' , (branch ifNil: [ '' ] ifNotNil: [ '-b ' , branch ])
				, ' ' , remoteUrl , ' ' , aDirectoryName.
	c output.	"Force the command to terminate."
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	GrowlMorph openWithLabel: 'gitfiletree://' contents: 'Cloning remote repository: done!'.
	self
		directory:
			(subdirectory isNil
				ifTrue: [ FileSystem workingDirectory / aDirectoryName ]
				ifFalse: [ FileSystem workingDirectory / aDirectoryName / subdirectory ])