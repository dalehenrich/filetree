tests
testWriteNRead
	| packageName versionInfo version |
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
			(self getWriteTestRepositoryWithAuthor: versionInfo author)
				storeVersion: version;
				storeDependencies: version ].
	Gofer new
		package: 'AAA';
		package: 'BBB';
		unload.
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	self
		shouldnt: [ 
			Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: packageName;
				load ]
		raise: Error.
	#('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]