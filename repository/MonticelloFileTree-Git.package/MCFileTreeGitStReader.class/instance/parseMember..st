utilities
parseMember: fileName
	"Parse a metadata member? We are dealing with git, so we should either use the tar or load directly the file."

	"Load directly the file."

	"Tried to use TarArchive but it's not implemented. Would using zip archive be better? Zip archives are of the same cost on the system; git log and git archive seems to be the expensive operations."
	
	"Todo: ensure we have the right encoding."

	| monticelloMetaDirectory c tokens tempZip |
	monticelloMetaDirectory := self fileUtils
		directoryFromPath: self monticelloMetaDirName
		relativeTo: (self fileUtils directoryFromPath: packageDirectory relativeTo: stream).
	c := PipeableOSProcess
		command: 'cd ' , monticelloMetaDirectory pathString , '; git archive --format=zip ' , commitID , ' ' , fileName.
	tempZip := ZipArchive new.
	tempZip readFrom: (ReadStream on: c output asByteArray).
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	tokens := [ self scanner scan: (ReadStream on: (tempZip contentsOf: fileName)) ]
		on: Error
		do: [ #() ].
	^ self associate: tokens