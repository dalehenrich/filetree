storing
internalStoreVersion: aVersion
	"Do a filetree store followed by a git add command."

	"Do not commit yet. Commit will only happens after checking the dependencies."

	| packageDirectoryString |
	super basicStoreVersion: aVersion.
	packageDirectoryString := (self class parseName: aVersion info name) first , self packageExtension.
	aVersion dependencies notEmpty
		ifTrue: [ self writeGitFileTreeProperties: (self fileUtils directoryFromPath: packageDirectoryString relativeTo: directory) ].
	self
		gitCommand:
			{'add'.
			packageDirectoryString}
		in: directory