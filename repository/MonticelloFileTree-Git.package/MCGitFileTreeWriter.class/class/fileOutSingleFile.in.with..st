instance creation
fileOutSingleFile: fileNameAndPath in: aMCFileTreeGitRepository with: aFileContentsAsString
	| aWriter subDirectoryString |
	aWriter := self new.
	aWriter repository: aMCFileTreeGitRepository.
	subDirectoryString := aMCFileTreeGitRepository subDirectoryString.
	aWriter
		outputCommit: aMCFileTreeGitRepository gitAuthorName
		email: aMCFileTreeGitRepository gitAuthorEmail
		time: DateAndTime now
		message: 'Writing and Commiting ' , fileNameAndPath.
	aWriter outputFileModify: fileNameAndPath with: aFileContentsAsString.
	^ aWriter stream