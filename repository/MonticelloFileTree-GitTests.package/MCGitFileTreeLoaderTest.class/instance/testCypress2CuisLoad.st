tests
testCypress2CuisLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'cuisCypress2');
        package: packageName;
        load.
    self validateAgainst: self snapshotCypressCuisDefinitions for: packageName