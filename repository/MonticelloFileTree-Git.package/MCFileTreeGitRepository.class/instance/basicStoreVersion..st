storing
basicStoreVersion: aVersion
	"Do a filetree store followed by the right git commands."

	"cd in the repository; do git add the package to register the new files, then git commit the package with the package message."

	"A git commit without any change return a non zero status without any error message."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id."

	| packageDirectory packageDirectoryString output |
	super basicStoreVersion: aVersion.
	packageDirectoryString := (self class parseName: aVersion info name) first , self packageExtension.
	self gitCommand: 'add "' , packageDirectoryString , '"' in: directory.
	self
		gitCommand:
			'commit -m "' , (self escapeForShell: aVersion info message convertToSystemString) , '" -- "' , packageDirectoryString
				, '"'
		in: directory.
	packageDirectory := self fileUtils directoryFromPath: packageDirectoryString relativeTo: directory.
	output := self gitCommand: 'log -1 --format="%H" ' in: packageDirectory.
	aVersion info
		id:
			(GitFileTreePackageEntry
				uuidFromGitSHA: (ByteArray readHexFrom: output substrings last)
				package: (aVersion info name copyFrom: 1 to: (aVersion info name lastIndexOf: $-) - 1))