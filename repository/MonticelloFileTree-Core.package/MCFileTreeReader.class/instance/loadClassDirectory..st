loading
loadClassDirectory: aDirectory
	| entries classProperties classComment |
	self flag: 'try explicit entries by name'.
	entries := (self fileUtils directoryFromEntry: aDirectory) entries.
	classProperties := self loadClassPropertiesFromEntries: entries.
	
	classComment := self loadClassCommentFromEntries: entries.
	self
		addClassDefinitionFrom: classProperties
		comment: classComment.
	
	self
		loadMethodsFrom: entries
		properties: classProperties
		extension: false