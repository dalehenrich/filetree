tests
testLoad
	| packageName |
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'AAA'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue161');
		package: packageName;
		load.
	#('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]