private-fast import
outputFileModify: aFilenameAsString with: dataAsString
	"Output a git fast-import file delete."

	"'M' SP <mode> SP 'inline' SP <path> LF
	data"

	self
		nextPutAll: 'M 644 inline ';
		nextPutAll: aFilenameAsString;
		lf;
		outputData: dataAsString