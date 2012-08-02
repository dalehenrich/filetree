utilities
addMethodDefinitionsForClass: className methodProperties: methodProperties in: entries
	entries do: [ :entry | 
		self 
			addMethodDefinitionForClass: className 
			methodProperties: methodProperties 
			entry: entry ]