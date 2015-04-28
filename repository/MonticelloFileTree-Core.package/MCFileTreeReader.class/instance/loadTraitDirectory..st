loading
loadTraitDirectory: aDirectory
	| entries comment properties |
	entries := (self fileUtils directoryFromEntry: aDirectory) entries.
	properties := self loadClassPropertiesFromEntries: entries.
	
	comment := self loadClassCommentFromEntries: entries.
	self
		addTraitDefinitionFrom: properties
		comment: comment.
	self
		loadMethodsFrom: entries
		properties: properties
		extension: false