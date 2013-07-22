testing
testLoad
	| packageName |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue33');
		package: packageName;
		load.
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ].
	self validateTimestamp: 'DaleHenrichs 6/12/2012 17:33:02'