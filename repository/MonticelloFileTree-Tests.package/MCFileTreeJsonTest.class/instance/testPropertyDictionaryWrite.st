tests
testPropertyDictionaryWrite
	| propertyDictionary stream |
	propertyDictionary := self propertyDictionary.
	stream := WriteStream on: String new.
	STON put: propertyDictionary asJsonOnStreamPretty: stream.
	self
		assert:
			stream contents withUnixLineEndings
				= self sampleJson withUnixLineEndings