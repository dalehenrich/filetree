testing
testLoad
	| packageName |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue113');
		package: packageName;
		load.
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ].
	self validateTimestamp: 'ThierryGoubier 9/27/2013 16:05:48'