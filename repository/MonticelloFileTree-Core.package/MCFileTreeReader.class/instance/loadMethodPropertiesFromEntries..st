loading
loadMethodPropertiesFromEntries: entries
	^ entries
		detect: [ :entry | self isMethodPropertyFile: entry ]
		ifFound: [ :propertyEntry | 
			propertyEntry
				readStreamDo: [ :fileStream | 
					"Issue 33: https://github.com/dalehenrich/filetree/issues/33"
					MCFileTreeJsonParser parseStream: fileStream ] ]
		ifNone: [ Dictionary new ]