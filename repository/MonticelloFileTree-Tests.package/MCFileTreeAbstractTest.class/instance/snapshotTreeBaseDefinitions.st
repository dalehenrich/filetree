private
snapshotTreeBaseDefinitions
    ^ self
        baseDefinitionsWithClassDefinition: (self snapshotClassDefinition: 'CypressMockBasic')
        timestamp: 'dkh ', (self conditionTimestamp: '4/9/2012 14:21:31')