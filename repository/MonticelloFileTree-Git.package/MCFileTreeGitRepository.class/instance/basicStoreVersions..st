storing
basicStoreVersions: versions
	"Save all those versions"

	"Recover the last commit id and update the version info to have a correctly synchronized in image id (apart from the version number?)"

	| packageDirectoryString output deps gitCommand outString s live liveInfo |
	versions
		do: [ :aVersion | 
			aVersion info message isString
				ifFalse: [ MCFileTreeGitError new
						signal: 'version message is not a string: ' , aVersion info name ].
			self internalStoreVersion: aVersion ].
	packageDirectoryString := Array
		streamContents: [ :stream | 
			versions
				do: [ :each | 
					stream
						nextPut: (self class parseName: each info name) first , self packageExtension ] ].
	gitCommand := Array
		streamContents: [ :stream | 
			stream nextPutAll: #('commit' '--allow-empty-message').
			(self class namesAt: versions first info author)
				ifNotNil: [ :n | 
					stream nextPut: '--author=' , (n at: #name) , ' ' , (n at: #email).
					stream
						nextPut: '--date=' , versions first info timeStamp printString ].
			stream
				nextPut: '-m';
				nextPut:
					(self
						escapeForShell: versions first info message convertToSystemString);
				nextPut: '--';
				nextPutAll: packageDirectoryString ].
	self getShortCommitID: (self gitCommand: gitCommand in: directory).
	live := (versions
		collect: [ :each | MCWorkingCopy hasPackageNamed: each package name ])
		reject: [ :each | each == false ].
	liveInfo := self
		versionInfoFromVersionsNamed: (live collect: [ :e | e package name ]).
	live
		with: liveInfo
		do: [ :b :versionInfo | b versionInfo: versionInfo ]