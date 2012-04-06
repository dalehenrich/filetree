testing
testLoad
    | name |
    name := 'Cypress-Mocks'.
    (MCSnapshot definitions: self targetDefinitions) updatePackage: (MCPackage new name: name)