tests
testCharacterEscape
	"See issue 119"

	| propertyDictionary stream |
	propertyDictionary := Dictionary new
		at: '\' put: '\\';
		at: '''' put: '"';
		yourself.
	stream := WriteStream on: String new.
	STON put: propertyDictionary asJsonOnStreamPretty: stream.
	self
		assert: stream contents withUnixLineEndings
		equals: self escapedJson withUnixLineEndings