running
tearDownPackages: anInstallerInstance
    (self hasPackage: 'Cypress-Mocks')
        ifTrue: [ anInstallerInstance package: 'Cypress-Mocks' ]