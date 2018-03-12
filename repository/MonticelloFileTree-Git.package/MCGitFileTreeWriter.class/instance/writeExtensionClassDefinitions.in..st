private-writing
writeExtensionClassDefinitions: anArrayOfString in: aPackagePath
	anArrayOfString
		do: [ :each | 
			| properties |
			properties := Dictionary new.
			properties at: 'name' put: each.
			self
				outputFileModify:
					aPackagePath , '/' , each , '.extension/properties'
						, self propertyFileExtension
				with:
					(String
						streamContents: [ :s | STON put: properties asJsonOnStreamPretty: s ])
						withUnixLineEndings ]