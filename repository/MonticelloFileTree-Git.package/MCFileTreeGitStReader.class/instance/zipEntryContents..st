utilities
zipEntryContents: aZipFileMember
	"Try to get the correct encoding for UTF8."

	"Try to return a stream on a text!"

	"TODO: replace by aZipFileMember>>contentsStreamFromEncoding: once issue 10978 is backported to 2.0."

	^ ReadStream on: ((TextConverter newForEncoding: 'utf8') convertFromSystemString: aZipFileMember contents)