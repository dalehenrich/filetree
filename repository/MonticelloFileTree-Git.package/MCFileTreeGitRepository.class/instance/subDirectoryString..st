accessing
subDirectoryString: aFileReference
	"relative path of that file reference inside the git repository."

	^ String
		streamContents: [ :s | 
			(aFileReference asAbsolute relativeTo: self gitTopDirectory) segments
				do: [ :e | 
					s
						nextPutAll: e;
						nextPut: $/ ] ]