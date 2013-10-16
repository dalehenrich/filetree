testing
testLoad
	| packageName |
	#('DDD') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'DDD'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue113');
		package: packageName;
		load.
	#('DDD') do: [ :pn | self assert: (self hasPackage: pn) ].
	self validateTimestamp: 'ThierryGoubier 10/15/2013 17:29:13'