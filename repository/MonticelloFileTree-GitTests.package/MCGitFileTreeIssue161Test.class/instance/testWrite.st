tests
testWrite
	| packageName version versionInfo |
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'AAA'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue161');
		package: packageName;
		load.
	#('AAA')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := (self getTestRepository: 'issue161') versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ]