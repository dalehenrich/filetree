tests
testWriteNRead2
	"A second version to test pre-writing the dependency. This trigger a specific path in loading dependencies, since the git configuration will be: a commit (cA) for AAA, a commit (cB) for BBB (and cA parent is cB); AAA listed as a single commit with dependencies."
	
	"What happens is that we are writing first BBB with commit cB, then writing BBB again as a dependency of AAA in commit cA. Git notices BBB hasn't changed between cB and cA, so returns correctly that BBB is not concerned by cA, and gitfiletree finds that there is no BBB package in commit cA."
	
	"Monticello uses sometimes that API (store dependencies independently first, then store package)."

	| packageName versionInfo version |
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'AAA'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'dependency02');
		package: packageName;
		load.
	#('BBB' 'AAA')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := (self getTestRepository: 'dependency02') versionWithInfo: versionInfo.
			(self getWriteTestRepositoryWithAuthor: versionInfo author) storeVersion: version ].
	Gofer new
		package: 'AAA';
		package: 'BBB';
		unload.
	#('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
	self
		shouldnt: [ 
			Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: packageName;
				load ]
		raise: Error.
	#('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]