testing
testTreeBaseLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'ver04');
        package: packageName;
        load.
    self validateAgainst: self snapshotTreeBaseDefinitions for: packageName