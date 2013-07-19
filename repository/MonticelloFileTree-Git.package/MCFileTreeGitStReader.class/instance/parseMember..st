utilities
parseMember: fileName
	"Parse a metadata member? Try to load directly the file, have a fallback in case it doesn't exist."

	"Leftover: protect from version reading attempts."

	| monticelloMetaDirectory c tokens tempZip |
	self assert: fileName ~= 'version'.
	monticelloMetaDirectory := self fileUtils
		directoryFromPath: self monticelloMetaDirName
		relativeTo: (self fileUtils directoryFromPath: packageDirectory relativeTo: stream).
	monticelloMetaDirectory exists
		ifFalse: [ ^ self associate: #() ].
	c := PipeableOSProcess
		command: 'cd ' , monticelloMetaDirectory pathString , '; git archive --format=zip ' , commitID hex , ' ' , fileName.
	tempZip := ZipArchive new.
	tempZip readFrom: (ReadStream on: c output asByteArray).
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	tokens := [ self scanner scan: (self zipEntryContents: (tempZip memberNamed: fileName)) ]
		on: Error
		do: [ #() ].
	^ self associate: tokens