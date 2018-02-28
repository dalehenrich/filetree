storing
basicStoreVersion: aVersion
	"Do a filetree store followed by in order, a check and save dependencies, a commit and an update of the version info."

	"Recover the last commit id and update the version info to have a correctly synchronized in image id (apart from the version number?)"

	"Note: for each package, the git command to do after the fast-import is:
	git reset HEAD <package path>
	git checkout HEAD <package path>"

	| versions string file |
	aVersion info message isString
		ifFalse: [ MCFileTreeGitError new
				signal: 'version message is not a string: ' , aVersion info name ].
	versions := self versionWithAllDependencies: aVersion.
	string := MCFileTreeGitFIWriter fileOutAll: versions on: self.
	self
		gitCommand: #('fast-import')
		in: directory
		withInput: string contents.
	self
		gitCommand:
			#('reset' 'HEAD')
				,
					(Array
						with: self subDirectoryString , aVersion package name , '.package/')
		in: directory.
	self
		gitCommand:
			#('checkout' 'HEAD')
				,
					(Array
						with: aVersion package name , '.package/')
		in: directory.
	versions
		do: [ :each | 
			| b |
			(b := MCWorkingCopy hasPackageNamed: each package name) == false
				ifFalse:
					[ b versionInfo: (self versionInfoFromVersionNamed: each package name) ] ]