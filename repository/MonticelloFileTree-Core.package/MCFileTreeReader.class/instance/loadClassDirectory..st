loading
loadClassDirectory: aDirectory
	| entries properties comment |
	entries := (self fileUtils directoryFromEntry: aDirectory) entries.
	properties := self loadClassPropertiesFromEntries: entries.
	
	comment := self loadClassCommentFromEntries: entries.
	self
		addClassDefinitionFrom: properties
		comment: comment.
	
	self
		loadMethodsFrom: entries
		properties: properties
		extension: false