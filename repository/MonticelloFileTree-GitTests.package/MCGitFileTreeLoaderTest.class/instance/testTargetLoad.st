testing
testTargetLoad
	| packageName repo |
	packageName := 'Cypress-Mocks'.
	Gofer new
		disablePackageCache;
		repository: (repo := self getTestRepository: 'ver02');
		package: packageName;
		load.
	repo allFileNames first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908'
		ifTrue: [ self validateAgainst: self targetDefinitionsForTravis for: packageName ]
		ifFalse: [ self validateAgainst: self targetDefinitions for: packageName ]