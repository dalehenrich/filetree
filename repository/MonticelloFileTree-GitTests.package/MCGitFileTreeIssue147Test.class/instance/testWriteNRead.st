tests
testWriteNRead
	| packageName versionInfo version repo |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue146');
		package: packageName;
		load.
	#('CCC')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := repo versionWithInfo: versionInfo.
			MCFileTreeGitRepository namesMap
				in: [ :nMap | 
					MCFileTreeGitRepository
						namesMap: nil;
						namesAt: 'ThierryGoubier' put: 'AU Thor' email: '<author@example.com>'.
					[ self getWriteTestRepository storeVersion: version ]
						ensure: [ MCFileTreeGitRepository namesMap: nMap ] ] ].
	Gofer new
		package: 'CCC';
		unload.
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	self
		shouldnt: [ 
			Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: packageName;
				load ]
		raise: Error.
	#('CCC')
		do: [ :pn | 
			self assert: (self hasPackage: pn).
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			self assert: versionInfo author = 'AUThor' ]