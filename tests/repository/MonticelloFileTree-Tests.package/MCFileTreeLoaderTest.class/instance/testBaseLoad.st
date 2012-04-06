testing
testBaseLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        repository: (self getTestRepository: 'ver01');
        package: packageName;
        load.
    self validateAgainst: self baseDefinitions for: packageName