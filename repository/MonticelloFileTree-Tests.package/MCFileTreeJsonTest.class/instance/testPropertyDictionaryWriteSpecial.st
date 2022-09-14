tests
testPropertyDictionaryWriteSpecial

	| propertyDictionary stream |
	propertyDictionary := Dictionary new
		at: #[97 92 47 10 9 32 1 122] asString put: 'tést".';
		at: 'ä' put: '';
		yourself.
	stream := WriteStream on: String new.
	propertyDictionary writeCypressJsonOn: stream.
	
	self
		assert: self sampleSpecialJsonNormalized withUnixLineEndings
		equals: stream contents withUnixLineEndings.