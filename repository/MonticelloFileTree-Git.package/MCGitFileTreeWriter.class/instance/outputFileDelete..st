private-fast import
outputFileDelete: aPathAsString
	"Output a git fast-import file delete."

	"'D' SP <path> LF"

	self
		nextPutAll: 'D ';
		nextPutAll: aPathAsString;
		lf