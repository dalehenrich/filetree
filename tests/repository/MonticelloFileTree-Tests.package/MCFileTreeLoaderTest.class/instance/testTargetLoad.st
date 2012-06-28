testing
testTargetLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'ver02');
        package: packageName;
        load.
    self validateAgainst: self targetDefinitions for: packageName