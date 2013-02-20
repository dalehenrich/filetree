private
standardClassDefinition: className
    ^ MCClassDefinition
        name: className
        superclassName: 'Object'
        category: 'Cypress-Mocks'
        instVarNames: #('name')
        classVarNames: #()
        poolDictionaryNames: #()
        classInstVarNames: #('current')
        comment: self classComment