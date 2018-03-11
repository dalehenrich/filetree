git querying
gitEntriesFor: aPathAsString
	"Get all entries for that particular string representing a path, relative to the git top directory, and with path segments separated by $/ even under windows apparently."

	"Format: an array listing name, mode, type, commit id."

	"If we have an error message with HEAD:, then it means an empty git repository."

	^ GitFileTreeObjectEntry
		fromAll:
			([ self
				gitCommand: (Array with: 'ls-tree' with: 'HEAD:' , aPathAsString)
				in: self gitTopDirectory ]
				on: MCFileTreeGitError
				do: [ :ex | 
					(ex messageText includesAll: 'HEAD:')
						ifTrue: [ '' ]
						ifFalse: [ ex signal ] ])