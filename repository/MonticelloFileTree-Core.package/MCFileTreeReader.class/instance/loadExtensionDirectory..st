loading
loadExtensionDirectory: aDirectory
	| entries classProperties |
	
	entries := (self fileUtils directoryFromEntry: aDirectory) entries.
	classProperties := self loadClassPropertiesFromEntries: entries.
	
	self
		loadMethodsFrom: entries
		properties: classProperties
		extension: true