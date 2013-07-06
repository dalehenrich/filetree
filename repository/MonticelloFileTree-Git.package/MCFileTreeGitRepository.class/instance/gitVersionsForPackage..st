git querying
gitVersionsForPackage: aDirectoryEntry
	"Query git for all the versions related to that directory entry"

	"Fact: if a package is updated without increasing the version, we don't see it with this code. If we see it (different git query), then we have multiple packages with the same version and not real way to distinguish them in the GUI."
	
	"As of now, see only changes to version."

	| c commitIDs monticelloMetaDirectory |
	monticelloMetaDirectory := self fileUtils
		directoryFromPath: self class monticelloMetaDirName
		relativeTo: (self fileUtils directoryFromPath: aDirectoryEntry relativeTo: directory).
	c := PipeableOSProcess command: 'cd ' , monticelloMetaDirectory pathString , '; for i in `git log --pretty="%H" -- version`; do echo "'
				, self tag , '"; echo $i; echo "' , self tag , '"; echo `git show $i:./version`; done'.
	commitIDs := ReadStream on: c output.
	c succeeded
		ifFalse: [ self error: 'Git error: ' , c errorPipelineContents ].
	^ commitIDs