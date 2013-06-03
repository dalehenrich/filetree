utilities
parseMember: fileName
	"Parse a metadata member? We are dealing with git, so we should either use the tar or load directly the file."

	"Load directly the file."

	| directory c fileContents tokens |
	directory := self fileUtils directoryFromPath: self monticelloMetaDirName relativeTo: packageDirectory.
	c := PipeableOSProcess
		command:
			'cd ' , packageDirectory pathString , '; git archive ' , commitID , ' ' , self monticelloMetaDirName , '/' , fileName , '| tar x -O '.
	fileContents := c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	tokens := self scanner scan: (ReadStream on: fileContents).
	^ self associate: tokens