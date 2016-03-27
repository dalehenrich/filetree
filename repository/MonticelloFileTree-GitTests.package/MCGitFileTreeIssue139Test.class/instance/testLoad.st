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
	self validateTimestamp: (self getTopTimestampFor: 'Issue 139' in: 'issue 139').
