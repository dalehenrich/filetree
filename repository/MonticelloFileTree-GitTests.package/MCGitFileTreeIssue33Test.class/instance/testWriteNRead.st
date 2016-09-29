tests
testWriteNRead
	| packageName versionInfo version repo |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue33.2');
		package: packageName;
		load.
	self validateTimestamp: (self getTopTimestampFor: 'CCC' in: 'issue33.2').
	#('CCC')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := repo versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ].
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
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ]