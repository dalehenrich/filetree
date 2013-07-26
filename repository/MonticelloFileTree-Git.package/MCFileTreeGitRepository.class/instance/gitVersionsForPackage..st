git querying
gitVersionsForPackage: aDirectoryEntry
	"Query git for all the commits related to that directory entry. Typical use: the package top-level directory entry, i.e. <pathOfRepository>/<packageName>.package. Return a stream of git sha1, the commit author, the date and time of commit, and the message for each commit changing something in this directory entry."

	| c commitIDs packageDirectory |
	packageDirectory := self fileUtils directoryFromPath: aDirectoryEntry relativeTo: directory.
	c := PipeableOSProcess
		command: 'cd ' , packageDirectory pathString , '; git log --log-size --format="%H|%an|%ai|%s" -- .'.
	commitIDs := ReadStream on: c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs