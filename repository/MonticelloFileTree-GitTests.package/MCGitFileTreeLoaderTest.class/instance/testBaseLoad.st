testing
testBaseLoad
	"If I inherit, I have to recreate all tests?"
	
	| packageName |
	packageName := 'Cypress-Mocks'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'ver01');
		package: packageName;
		load.
	self validateAgainst: self baseDefinitions for: packageName