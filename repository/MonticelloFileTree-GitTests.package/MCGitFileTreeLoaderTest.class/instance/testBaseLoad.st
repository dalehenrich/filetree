tests
testBaseLoad
	"If I inherit, I have to recreate all tests?"

	| packageName repo |
	packageName := 'Cypress-Mocks'.
	repo := self getTestRepository: 'ver01.1'.
	Gofer new
		disablePackageCache;
		repository: repo;
		package: packageName;
		load.
	self validateAgainst: self baseDefinitions for: packageName