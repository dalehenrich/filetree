tests
testLoad
	<expectedFailure>
	| packageName |
	packageName := 'Cypress-TraitMocks'.
	Gofer new
		disablePackageCache;
		repository: (self getTestRepository: 'traits');
		package: packageName;
		load.
	self validateAgainst: self traitDefinitions for: packageName