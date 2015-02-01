i/o
basicStoreVersion: aVersion
	"Do a filetree store followed by the right git commands."

	"cd in the repository; do git add the package to register the new files, then git commit the package with the package message."

	"A git commit without any change return a non zero status without any error message."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id."

	| c packageDirectory packageDirectoryString output |
	super basicStoreVersion: aVersion.
	packageDirectoryString := (self class parseName: aVersion info name) first , self packageExtension.
	[ 
	c := PipeableOSProcess
		command:
			'cd "' , (self fileUtils directoryPathString: directory) , '"; git add "' , packageDirectoryString , '"; git commit -m "'
				, (self escapeForShell: aVersion info message convertToSystemString) , '" -- "' , packageDirectoryString , '"'.
	output := c output.
	c succeeded
		ifFalse: [ 
			| serr |
			serr := c errorPipelineContents.
			serr notEmpty
				ifTrue: [ self error: 'Git error: ' , serr ] ] ]
		ensure: [ c closePipes ].
	packageDirectory := self fileUtils directoryFromPath: packageDirectoryString relativeTo: directory.
	[ 
	c := PipeableOSProcess
		command: 'cd "' , (self fileUtils directoryPathString: packageDirectory) , '"; git log -1 --format="%H" '.
	output := c output.
	c succeeded
		ifFalse: [ 
			| serr |
			serr := c errorPipelineContents.
			serr notEmpty
				ifTrue: [ self error: 'Git log error: ' , serr ] ] ]
		ensure: [ c closePipes ].
	aVersion info
		id:
			(GitFileTreePackageEntry
				uuidFromGitSHA: (ByteArray readHexFrom: output substrings last)
				package: (aVersion info name copyFrom: 1 to: (aVersion info name lastIndexOf: $-) - 1))