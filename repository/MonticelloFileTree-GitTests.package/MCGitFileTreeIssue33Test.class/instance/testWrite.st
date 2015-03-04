tests
testWrite
	| packageName version versionInfo repo |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue33.2');
		package: packageName;
		load.
	self validateTimestamp: 'ThierryGoubier 9/12/2013 17:14:30'.
	#('CCC')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := repo versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ]