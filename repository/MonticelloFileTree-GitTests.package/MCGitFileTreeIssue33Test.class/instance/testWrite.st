testing
testWrite
	| packageName version versionInfo |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue33');
		package: packageName;
		load.
	self validateTimestamp: 'dkh 11/2/1954 16:15'.
	#('CCC')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := (self getTestRepository: 'issue33') versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ]