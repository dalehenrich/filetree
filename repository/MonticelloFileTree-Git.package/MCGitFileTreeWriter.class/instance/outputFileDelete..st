private-fast import
outputFileDelete: aPathAsString
	"Output a git fast-import file delete."

	"'D' SP <path> LF"

	self stream
		nextPutAll: 'D ';
		nextPutAll: aPathAsString.
	self stream nextPut: Character lf