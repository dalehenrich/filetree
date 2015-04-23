adding
loadExtensionDirectory: aDirectory
	| entries classProperties |
	self flag: 'rename? loadExtensionDirectory:'.
	
	entries := (self fileUtils directoryFromEntry: aDirectory) entries.
	classProperties := self loadClassPropertiesFromEntries: entries.
	
	self loadMethodsFrom: entries properties: classProperties extension: true