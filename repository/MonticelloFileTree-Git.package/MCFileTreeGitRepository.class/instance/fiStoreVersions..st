storing
fiStoreVersions: anArrayOfVersion
	"Do a filetree store followed by in order, a check and save dependencies, a commit and an update of the version info."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id (apart from the version number?)"

	| string |
	anArrayOfVersion first info message isString
		ifFalse: [ MCFileTreeGitError new
				signal: 'version message is not a string: ' , anArrayOfVersion first info name ].
	string := MCGitFileTreeWriter fileOutAll: anArrayOfVersion on: self.
	self
		gitCommand: #('fast-import')
		in: self gitTopDirectory
		withInput: string contents.
	self
		gitCommand:
			#('reset' 'HEAD')
				,
					(anArrayOfVersion
						collect: [ :v | self subDirectoryString , v package name , '.package/' ])
		in: self gitTopDirectory.
	self
		gitCommand:
			#('checkout' 'HEAD')
				,
					(anArrayOfVersion
						collect: [ :v | self subDirectoryString , v package name , '.package/' ])
		in: self gitTopDirectory.
	self gitCommand: #('clean' '-f') in: directory.
	anArrayOfVersion
		do: [ :each | 
			| b |
			(b := MCWorkingCopy hasPackageNamed: each package name) == false
				ifFalse:
					[ b versionInfo: (self versionInfoFromVersionNamed: each package name) ] ]