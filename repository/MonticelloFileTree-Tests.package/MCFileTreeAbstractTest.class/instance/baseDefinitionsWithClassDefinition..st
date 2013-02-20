private
baseDefinitionsWithClassDefinition: classDefinition
    ^ self baseDefinitionsWithClassDefinition: classDefinition timestamp: 'dkh ', (self conditionTimestamp: '4/5/2012 10:10:48')