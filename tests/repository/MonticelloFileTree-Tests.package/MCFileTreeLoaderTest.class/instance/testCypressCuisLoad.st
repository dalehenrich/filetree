testing
testCypressCuisLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'cuisCypress');
        package: packageName;
        load.
    self validateAgainst: self snapshotCypressCuisDefinitions for: packageName