private-writing
writeMethodDefinitions: anArrayOfMCMethodDefinition in: aPackagePath
	anArrayOfMCMethodDefinition
		do: [ :each | 
			self
				writeMethodDefinition: each
				in: aPackagePath , '/' , each className , '.class' ]