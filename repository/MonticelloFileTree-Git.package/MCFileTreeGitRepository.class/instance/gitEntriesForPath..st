git querying
gitEntriesForPath: aPath
	"Get all entries for that particular path."

	"Format: an array listing name, mode, type, commit id."

	| treeish |
	treeish := String
		streamContents: [ :s | 
			s nextPutAll: 'HEAD:'.
			(aPath asAbsolute relativeTo: self gitTopDirectory) segments
				do: [ :e | s nextPutAll: e ]
				separatedBy: [ s nextPut: $/ ] ].
	^ GitFileTreeObjectEntry
		fromAll:
			(self
				gitCommand: (Array with: 'ls-tree' with: treeish)
				in: self gitTopDirectory)