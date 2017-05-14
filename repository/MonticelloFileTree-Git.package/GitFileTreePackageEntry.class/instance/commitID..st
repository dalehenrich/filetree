accessing
commitID: aString
	"I should keep the string here."

	commitID := ByteArray readHexFrom: aString.
	shortCommitID := aString copyFrom: 1 to: 7