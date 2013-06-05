i/o
basicStoreVersion: aVersion
	"Do a filetree store followed by the right git commands."
	
	"cd in the repository; do git add the package to register the new files, then git commit the package with the package message."

	| c packageDirectoryString |
	super basicStoreVersion: aVersion.
	packageDirectoryString := (self class parseName: aVersion info name) first, self packageExtension.
	c := PipeableOSProcess
		command:
			'cd ' , directory pathString , '; git add ' , packageDirectoryString , '; git commit -m "' , aVersion info message
				, '" -- ' , packageDirectoryString.
	c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ]