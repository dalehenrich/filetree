storing
basicStoreVersion: aVersion
	"Do a filetree store followed by in order, a check and save dependencies, a commit and an update of the version info."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id (apart from the version number?)"

	| packageDirectoryString output deps gitCommand |
	self internalStoreVersion: aVersion.
	deps := self internalStoreDependencies: aVersion.
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
	gitCommand := String
		streamContents: [ :stream | 
			stream nextPutAll: 'commit --allow-empty-message'.
			(self class namesAt: aVersion info author)
				ifNotNil: [ :n | 
					stream
						nextPutAll: ' --author="';
						nextPutAll: (n at: #name);
						nextPut: $ ;
						nextPutAll: (n at: #email);
						nextPut: $" ].
			stream
				nextPutAll: ' -m "';
				nextPutAll: (self escapeForShell: aVersion info message convertToSystemString);
				nextPutAll: '" -- ';
				nextPutAll: packageDirectoryString ].
	self gitCommand: gitCommand in: directory.
	output := (self gitCommand: 'log -1 --format="%H" ' in: directory) substrings last.
	{aVersion} , deps
		do: [ :each | 
			each info
				id:
					(GitFileTreePackageEntry
						uuidFromGitSHA: (ByteArray readHexFrom: output)
						package: (aVersion info name copyFrom: 1 to: (aVersion info name lastIndexOf: $-) - 1)) ]