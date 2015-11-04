tests
testFileTreeLoad
	"Unable to load the dependency. Don't bother."

	| packageName |
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'AAA'.
	Gofer new
		disablePackageCache;
		repository: (self getTestFileTreeRepository: 'issue161');
		package: packageName;
		load.
	#('AAA') do: [ :pn | self assert: (self hasPackage: pn) ]