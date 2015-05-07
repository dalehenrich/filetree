loading
loadExtensionDirectory: aDirectory
	| entries properties |
	
	entries := (self fileUtils directoryFromEntry: aDirectory) entries.
	properties := self loadClassPropertiesFromEntries: entries.
	
	self
		loadMethodsFrom: entries
		properties: properties
		extension: true