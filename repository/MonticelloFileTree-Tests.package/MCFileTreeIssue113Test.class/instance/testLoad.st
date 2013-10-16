tests
testLoad
	"When loading without metadata, we will not check the timestamp since it is auto-generated."

	| packageName |
	#('DDD') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'DDD'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue113');
		package: packageName;
		load.
	#('DDD') do: [ :pn | self assert: (self hasPackage: pn) ]