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
	self validateTimestamp: 'ThierryGoubier 3/26/2016 22:43:45'
	
