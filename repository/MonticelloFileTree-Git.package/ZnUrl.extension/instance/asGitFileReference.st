*monticellofiletree-git-override
asGitFileReference
	"Convert the receiver into a new FileReference object.
	Note that for a FileReference a trailing slash is not relevant"

	| path |
	self isSlash
		ifTrue: [ ^ FileSystem root ].
	path := self isDirectoryPath
		ifTrue: [ segments allButLast ]
		ifFalse: [ segments copy ].
	^ FileReference fileSystem: FileSystem disk path: (AbsolutePath withAll: path)