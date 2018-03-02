git querying
gitCatFile: aHashString
	"Cat this object content."

	^ self
		gitCommand: (Array with: 'cat-file' with: 'blob' with: aHashString)
		in: self gitTopDirectory