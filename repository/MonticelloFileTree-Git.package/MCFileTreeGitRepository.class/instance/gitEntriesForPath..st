git querying
gitEntriesForPath: aPath
	"Get all entries for that particular path."

	"Format: an array listing name, mode, type, commit id."

	| treeish |
	treeish := String
		streamContents: [ :s | 
			| segs |
			segs := (aPath asAbsolute relativeTo: self gitTopDirectory)
				segments.
			s nextPutAll: 'HEAD:'.
			segs do: [ :e | s nextPutAll: e ] separatedBy: [ s nextPut: $/ ] ].
	^ GitFileTreeObjectEntry
		fromAll:
			(self
				gitCommand: (Array with: 'ls-tree' with: treeish)
				in: self gitTopDirectory
				onErrorDo: [ :message | 
					(message beginsWith: 'fatal: Not a valid object name HEAD')
						ifTrue: [ ^ #() ] ])