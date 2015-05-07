reading
on: aStream fileName: aDirectoryName
	^ (self on: aStream)
		packageDirectory: aDirectoryName;
		yourself