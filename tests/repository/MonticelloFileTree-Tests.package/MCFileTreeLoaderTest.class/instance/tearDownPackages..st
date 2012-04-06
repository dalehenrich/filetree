running
tearDownPackages: aGoferInstance
    (self hasPackage: 'Cypress-Mocks')
        ifTrue: [ aGoferInstance package: 'Cypress-Mocks' ]