tests
testLoad
	| packageName |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue33.2');
		package: packageName;
		load.
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ].
	self validateTimestamp: (self getTopTimestampFor: 'CCC' in: 'issue33.2')
	
