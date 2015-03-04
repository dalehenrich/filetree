tests
testWrite
	| packageName version versionInfo repo |
	#('Issue 139') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'Issue 139'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue 139');
		package: packageName;
		load.
	self validateTimestamp: 'ThierryGoubier 2/3/2015 22:27:31'.
	#('Issue 139')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := repo versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ]