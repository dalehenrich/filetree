testing
testWriteNRead
	| packageName versionInfo version |
	packageName := 'Issue72'.
	{packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue72.2');
		package: packageName;
		load.
"	self validatePackageMetadata.
"	{packageName}
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := (self getTestRepository: 'issue72.2') versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ].
	Gofer new
		package: packageName;
		unload.
	{packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
	self
		shouldnt: [ 
			Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: packageName;
				load ]
		raise: Error.
	{packageName} do: [ :pn | self assert: (self hasPackage: pn) ].
	self validatePackageMetadata