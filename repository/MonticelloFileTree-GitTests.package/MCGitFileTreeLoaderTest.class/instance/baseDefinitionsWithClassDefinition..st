utility
baseDefinitionsWithClassDefinition: classDefinition
	^ self
		baseDefinitionsWithClassDefinition: classDefinition
		timestamp: 'DaleHenrichs ' , (self conditionTimestamp: '4/6/2012 12:30:16')