utility
baseDefinitionsForTravis
	^ self
		baseDefinitionsWithClassDefinition: (self standardClassDefinition: 'CypressMockBasic')
		timestamp: 'DaleHenrich' , (self conditionTimestamp: '28/6/2012 3:07:37')