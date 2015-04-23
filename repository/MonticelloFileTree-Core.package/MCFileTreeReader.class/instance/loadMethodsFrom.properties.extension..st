loading
loadMethodsFrom: entries properties: classProperties extension: extension
	| methodProperties |
	methodProperties := self loadMethodPropertiesFromEntries: entries.
	entries
		detect: [ :entry | entry isDirectory and: [ entry name = 'class' ] ]
		ifFound: [ :classSideDirectory | 
			self
				addMethodDefinitionsForClass: (classProperties at: 'name')
				methodProperties: methodProperties
				extension: extension
				meta: true
				in: classSideDirectory ].
	entries
		detect: [ :entry | entry isDirectory and: [ entry name = 'instance' ] ]
		ifFound: [ :instanceSideDirectory | 
			self
				addMethodDefinitionsForClass: (classProperties at: 'name')
				methodProperties: methodProperties
				extension: extension
				meta: false
				in: instanceSideDirectory ]