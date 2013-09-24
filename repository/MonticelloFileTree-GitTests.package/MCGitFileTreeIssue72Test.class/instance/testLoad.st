testing
testLoad
	| packageName |
	packageName := 'Issue72'.
	{packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue72.2');
		package: packageName;
		load.
	self validatePackageMetadata