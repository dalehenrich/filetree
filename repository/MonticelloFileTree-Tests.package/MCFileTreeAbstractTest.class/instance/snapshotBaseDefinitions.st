private
snapshotBaseDefinitions
    ^ self
        baseDefinitionsWithClassDefinition: (self snapshotClassDefinition: 'CypressMockBasic')
        timestamp: 'dkh ', (self conditionTimestamp: '4/9/2012 13:58:27')