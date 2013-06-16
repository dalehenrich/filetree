utilities
zipEntryContents: aZipFileMember
	"Try to get the correct encoding for UTF8."

	"Either we use Latin1 (ZipFileMember>>contentsStream)
	or do we use no encoding? (ZipFileMember>>contents)."

	"There is probably a UTF8 encoding somewhere."

	"Try to return a stream on a text!"

	^ ReadStream on: (ZnUTF8Encoder new decodeBytes: aZipFileMember contents asByteArray)