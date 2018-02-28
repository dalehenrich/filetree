private-writing
writeClassDefinitions: anArrayOfMCClassDefinition in: aPackagePath
	anArrayOfMCClassDefinition
		do: [ :each | 
			self
				writeClassDefinition: each
				in: aPackagePath , '/' , each className , '.class' ]