testing
testTargetLoadWithVersionDir
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'ver06');
        package: packageName;
        load.
    self validateAgainst: self targetDefinitions for: packageName