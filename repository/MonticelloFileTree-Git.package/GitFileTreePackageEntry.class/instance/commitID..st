accessing
commitID: aString
	commitID := ByteArray readHexFrom: aString.
	shortCommitID := aString copyFrom: 1 to: 7