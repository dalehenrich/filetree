tests
testLoad
	| packageName |
	#('Issue 139') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'Issue 139'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue 139');
		package: packageName;
		load.
	#('Issue 139') do: [ :pn | self assert: (self hasPackage: pn) ].
	self validateTimestamp: 'ThierryGoubier 2/3/2015 22:27:31'