testing
testSnapshotBaseLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'ver03');
        package: packageName;
        load.
    self validateAgainst: self snapshotBaseDefinitions for: packageName