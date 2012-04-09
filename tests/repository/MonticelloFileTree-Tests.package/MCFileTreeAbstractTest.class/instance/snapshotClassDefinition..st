private
snapshotClassDefinition: className
    ^ MCClassDefinition
        name: className
        superclassName: 'Object'
        category: 'Cypress-Mocks'
        instVarNames: #('name')
        classVarNames: #()
        poolDictionaryNames: #()
        classInstVarNames: #('current')
        comment:
            'This mock contains basic class and instance method selectors.
'