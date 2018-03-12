private-fast import
outputData: aString
	"Output a git fast-import data item."

	"'data' SP <count> LF
	<raw> LF?"

	| utf8ByteArray |
	utf8ByteArray := aString utf8Encoded.
	self
		nextPutAll: 'data ';
		nextPutAll: utf8ByteArray size printString;
		lf.
	self stream nextPutAll: utf8ByteArray.
	self lf