testing
testTargetLoad
    | packageName |
    packageName := 'Cypress-Mocks'.
    Installer monticello
        mc: (self getTestRepository: 'ver02');
        install: packageName.
    self validateAgainst: self targetDefinitions for: packageName