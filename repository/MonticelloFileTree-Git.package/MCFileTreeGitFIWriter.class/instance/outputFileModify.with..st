private-fast import
outputFileModify: aFilenameAsString with: dataAsString
	"Output a git fast-import file delete."

	"'M' SP <mode> SP 'inline' SP <path> LF
	data"

	self stream
		nextPutAll: 'M 644 inline ';
		nextPutAll: aFilenameAsString.
	self stream nextPut: Character lf.
	self outputData: dataAsString