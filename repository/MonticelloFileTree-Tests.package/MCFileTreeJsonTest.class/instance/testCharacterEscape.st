tests
testCharacterEscape
	"See issue 119"
	| propertyDictionary stream |
	
	propertyDictionary := Dictionary new
		at: '\' put: '\\';
		yourself.
	stream := WriteStream on: String new.
	propertyDictionary writeCypressJsonOn: stream.
	self assert: stream contents withUnixLineEndings equals: self escapedJson withUnixLineEndings