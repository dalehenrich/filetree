private-writing
writeTraitDefinitions: anArrayOfMCTraitDefinition in: aPackagePath
	anArrayOfMCTraitDefinition
		do: [ :each | 
			self
				writeClassDefinition: each
				in: aPackagePath , '/' , each className , '.trait' ]