private-writing
writeClassDefinition: aMCClassDefinition in: aClassPath
	"Write as two items: comment and class definition."

	self
		outputFileModify: aClassPath , '/README.md'
		with: aMCClassDefinition comment withUnixLineEndings.
	self
		outputFileModify: aClassPath , '/properties' , self propertyFileExtension
		with: (self buildClassDefinition: aMCClassDefinition)