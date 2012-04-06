running
tearDown
    | name |
    super tearDown.
    name := 'Cypress-Mocks'.
    (MCSnapshot definitions: self baseDefinitions) updatePackage: (MCPackage new name: name)