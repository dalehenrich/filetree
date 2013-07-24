testing
testWriteNRead
	| packageName versionInfo version repo |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue33');
		package: packageName;
		load.
	repo allFileNames first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908'
		ifTrue: [ self validateTimestamp: 'DaleHenrichs 28/6/2012 3:07:37' ]
		ifFalse: [ self validateTimestamp: 'DaleHenrichs 6/12/2012 17:33:02' ].
	#('CCC')
		do: [ :pn | 
			versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ]) ancestors first.
			version := (self getTestRepository: 'issue33') versionWithInfo: versionInfo.
			self getWriteTestRepository storeVersion: version ].
	Gofer new
		package: 'CCC';
		unload.
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	self
		shouldnt: [ 
			Gofer new
				disablePackageCache;
				repository: self getWriteTestRepository;
				package: packageName;
				load ]
		raise: Error.
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ]