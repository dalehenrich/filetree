storing
basicStoreVersion: aVersion
	"Do a filetree store followed by in order, a check and save dependencies, a commit and an update of the version info."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id (apart from the version number?)"

	| packageDirectory packageDirectoryString output deps |
	self internalStoreVersion: aVersion.
	deps := self internalStoreDependencies: aVersion.
	packageDirectory := self fileUtils
		directoryFromPath: (self class parseName: aVersion info name) first , self packageExtension
		relativeTo: directory.
	deps notEmpty
		ifTrue: [ self writeGitFileTreeProperties: packageDirectory ].
	packageDirectoryString := String
		streamContents: [ :stream | 
			stream nextPut: $".
			{aVersion} , deps
				do: [ :each | 
					stream
						nextPutAll: (self class parseName: each info name) first;
						nextPutAll: self packageExtension ]
				separatedBy: [ stream nextPutAll: '" "' ].
			stream nextPutAll: '"' ].
	self
		gitCommand:
			'commit -m "' , (self escapeForShell: aVersion info message convertToSystemString) , '" -- ' , packageDirectoryString
		in: directory.
	output := (self gitCommand: 'log -1 --format="%H" ' in: packageDirectory) substrings last.
	{aVersion} , deps
		do: [ :each | 
			each info
				id:
					(GitFileTreePackageEntry
						uuidFromGitSHA: (ByteArray readHexFrom: output)
						package: (aVersion info name copyFrom: 1 to: (aVersion info name lastIndexOf: $-) - 1)) ]