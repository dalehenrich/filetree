tests
testWriteNRead
	| packageName versionInfo version |
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'AAA'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'dependency02');
		package: packageName;
		load.
	#('AAA' 'BBB')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := (self getTestRepository: 'dependency02') versionWithInfo: versionInfo.
			(self getWriteTestRepositoryWithAuthor: versionInfo author) storeVersion: version ].
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