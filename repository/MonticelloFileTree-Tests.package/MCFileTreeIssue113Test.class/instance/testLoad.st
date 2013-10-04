tests
testLoad
	"When loading without metadata, we will not check the timestamp since it is auto-generated."

	| packageName |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'issue113');
		package: packageName;
		load.
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ]