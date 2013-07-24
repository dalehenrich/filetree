testing
testLoad
	| packageName repo |
	#('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
	packageName := 'CCC'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'issue33');
		package: packageName;
		load.
	#('CCC') do: [ :pn | self assert: (self hasPackage: pn) ].
	repo allFileNames first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908'
		ifTrue: [ self validateTimestamp: 'DaleHenrichs 28/6/2012 3:07:37' ]
		ifFalse: [ self validateTimestamp: 'DaleHenrichs 6/12/2012 17:33:02' ]