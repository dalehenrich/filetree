as yet unclassified
basicStoreVersion: aVersion
	"Simply do a filetree store, but, update then the git."

	| c packageDirectoryString |
	super basicStoreVersion: aVersion.
	packageDirectoryString := (self class parseName: aVersion info name) last.
	c := PipeableOSProcess
		command:
			'cd ' , directory pathString , '; git add ' , packageDirectoryString , '; git commit -m "' , aVersion info message
				, '" -- ' , packageDirectoryString.
	c output.
	self assert: c succeeded