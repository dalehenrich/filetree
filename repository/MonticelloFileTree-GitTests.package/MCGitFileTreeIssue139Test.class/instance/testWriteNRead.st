tests
testWriteNRead
	| packageName versionInfo version repo |
	#('Issue 139') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'Issue 139'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue 139');
		package: packageName;
		load.
	self validateTimestamp: 'ThierryGoubier 8/18/2015 19:10:23'.
	#('Issue 139')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := repo versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ].
	Gofer new
		package: 'Issue 139';
		unload.
	#('Issue 139') do: [ :pn | self deny: (self hasPackage: pn) ].
	self
		shouldnt: [ 
			Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: packageName;
				load ]
		raise: Error.
	#('Issue 139') do: [ :pn | self assert: (self hasPackage: pn) ]