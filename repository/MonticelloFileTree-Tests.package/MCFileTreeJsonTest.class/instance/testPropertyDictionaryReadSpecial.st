tests
testPropertyDictionaryReadSpecial

	| propertyDictionary keys |
	propertyDictionary := MCFileTreeJsonParser parse: self sampleSpecialJson.
	
	keys := propertyDictionary keys sorted.
	self
		assert: #[97 92 47 10 9 32 1 122] asString
		equals: keys first.
	self
		assert: 'tést".'
		equals: (propertyDictionary at: keys first).
	self
		assert: 'ä'
		equals: keys second.
	self
		assert: ''
		equals: (propertyDictionary at: keys second).