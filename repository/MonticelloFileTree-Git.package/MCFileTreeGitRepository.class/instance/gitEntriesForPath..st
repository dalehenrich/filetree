git querying
gitEntriesForPath: aPath
	"Get all entries for that particular path."

	"Format: an array listing name, mode, type, commit id."

	"If we have an error message with HEAD:, then it means an empty git repository."

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
			([ self
				gitCommand: (Array with: 'ls-tree' with: treeish)
				in: self gitTopDirectory ]
				on: MCFileTreeGitError
				do: [ :ex | 
					(ex messageText includesAll: 'HEAD:')
						ifTrue: [ '' ]
						ifFalse: [ ex signal ] ])