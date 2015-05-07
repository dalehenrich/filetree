adding
addTraitDefinitionFrom: properties comment: comment
	definitions add:
		(MCTraitDefinition
			name: (properties at: 'name')
			traitComposition: (properties at: 'traitcomposition' ifAbsent: [ '{}' ])
			category: (properties at: 'category' ifAbsent: [ self packageNameFromPackageDirectory ])
			comment: comment
			commentStamp: (properties at: 'commentStamp' ifAbsent: [ '' ])).
	
	properties at: 'classtraitcomposition' ifPresent: [ :classTraitComposition |
		definitions add:
			(MCClassTraitDefinition
				baseTraitName: (properties at: 'name')
				classTraitComposition: classTraitComposition) ]