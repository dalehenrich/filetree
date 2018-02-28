private-fast import
outputData: aString
	"Output a git fast-import data item."

	"'data' SP <count> LF
	<raw> LF?"

	| utf8String |
	utf8String := aString utf8Encoded asString.
	self stream
		nextPutAll: 'data ';
		nextPutAll: utf8String size printString.
	self stream nextPut: Character lf.
	self stream nextPutAll: utf8String.
	self stream nextPut: Character lf