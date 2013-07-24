testing
testBaseLoad
	"If I inherit, I have to recreate all tests?"

	| packageName repo |
	packageName := 'Cypress-Mocks'.
	repo := self getTestRepository: 'ver01'.
	Gofer new
		disablePackageCache;
		repository: repo;
		package: packageName;
		load.
	repo allFileNames first commitID hex = '4058b81ec118a0acc9ca55714e53385278e2a908'
		ifTrue: [ self validateAgainst: self baseDefinitionsForTravis for: packageName ]
		ifFalse: [ self validateAgainst: self baseDefinitions for: packageName ]