testing
testBaseLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Installer monticello
        mc: (self getTestRepository: 'ver01');
        install: packageName.
    self validateAgainst: self baseDefinitions for: packageName