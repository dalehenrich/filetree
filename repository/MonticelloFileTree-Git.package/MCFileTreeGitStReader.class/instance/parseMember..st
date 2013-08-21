utilities
parseMember: fileName
	"Parse a metadata member? Try to load directly the file, have a fallback in case it doesn't exist."

	"Todo: ensure we have the right encoding."

	| monticelloMetaDirectory c tokens tempZip |
	monticelloMetaDirectory := self fileUtils
		directoryFromPath: self monticelloMetaDirName
		relativeTo: (self fileUtils directoryFromPath: packageDirectory relativeTo: stream).
	monticelloMetaDirectory exists
		ifFalse: [ ^ self associate: #() ].
	c := PipeableOSProcess
		command: 'cd ' , monticelloMetaDirectory pathString , '; git archive --format=zip ' , commitID , ' ' , fileName.
	tempZip := ZipArchive new.
	tempZip readFrom: (ReadStream on: c output asByteArray).
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	tokens := [ self scanner scan: (self zipEntryContents: (tempZip memberNamed: fileName)) ]
		on: Error
		do: [ #() ].
	^ self associate: tokens