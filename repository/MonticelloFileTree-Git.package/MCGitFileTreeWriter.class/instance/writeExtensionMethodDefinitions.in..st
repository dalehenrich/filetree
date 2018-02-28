private-writing
writeExtensionMethodDefinitions: anArrayOfMCMethodDefinition in: aPackagePath
	anArrayOfMCMethodDefinition
		do: [ :each | 
			self
				writeMethodDefinition: each
				in: aPackagePath , '/' , each className , '.extension' ]