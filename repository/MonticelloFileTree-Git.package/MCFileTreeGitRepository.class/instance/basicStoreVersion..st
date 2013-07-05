i/o
basicStoreVersion: aVersion
	"Do a filetree store followed by the right git commands."

	"cd in the repository; do git add the package to register the new files, then git commit the package with the package message."

	"A git commit without any change return a non zero status without any error message."

	| c packageDirectoryString |
	super basicStoreVersion: aVersion.
	packageDirectoryString := (self class parseName: aVersion info name) first , self packageExtension.
	c := PipeableOSProcess
		command:
			'cd ' , directory pathString , '; git add ' , packageDirectoryString , '; git commit -m "'
				, (self escapeForShell: aVersion info message convertToSystemString) , '" -- ' , packageDirectoryString.
	c output.
	c succeeded
		ifFalse: [ 
			| serr |
			serr := c errorPipelineContents.
			serr notEmpty
				ifTrue: [ self error: 'Git error: ' , serr ] ]