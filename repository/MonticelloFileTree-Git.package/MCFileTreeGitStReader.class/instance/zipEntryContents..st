utilities
zipEntryContents: aZipFileMember
	"Try to get the correct encoding for UTF8."

	^ aZipFileMember contentStreamFromEncoding: 'utf8'
