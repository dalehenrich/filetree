storing
basicStoreVersions: anArrayOfVersion
	"Do a filetree store followed by in order, a check and save dependencies, a commit and an update of the version info."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id (apart from the version number?)"

	| versions string |
	anArrayOfVersion first info message isString
		ifFalse: [ MCFileTreeGitError new
				signal: 'version message is not a string: ' , anArrayOfVersion first info name ].
	string := MCFileTreeGitFIWriter fileOutAll: anArrayOfVersion on: self.
	self gitCommand: #('fast-import') in: directory withInput: string.
	anArrayOfVersion
		do: [ :each | 
			| b |
			(b := MCWorkingCopy hasPackageNamed: each package name) == false
				ifFalse:
					[ b versionInfo: (self versionInfoFromVersionNamed: each package name) ] ]