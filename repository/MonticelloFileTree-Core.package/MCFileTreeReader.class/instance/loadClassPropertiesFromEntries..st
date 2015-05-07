loading
loadClassPropertiesFromEntries: entries
	^ entries
		detect: [ :entry | self isPropertyFile: entry ]
		ifFound: [ :propertyEntry | propertyEntry readStreamDo: [ :fileStream | MCFileTreeJsonParser parseStream: fileStream ] ]
		ifNone: [ self halt: 'there should have been a properties file' ]