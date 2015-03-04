adding
addMethodDefinitionsForClass: className methodProperties: methodProperties extension: extensionMethod meta: classIsMeta in: directory
	(self fileUtils directoryFromEntry: directory) entries
		select: [ :each | each name endsWith: '.st' ]
		thenDo: [ :methodEntry | 
			definitions add:
				(self
					loadMethodDefinitionForClass: className
					properties: methodProperties
					extension: extensionMethod
					meta: classIsMeta
					fromEntry: methodEntry) ]