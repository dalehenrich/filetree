loading
loadDefinitions
	definitions := OrderedCollection new.
	definitions add: (MCOrganizationDefinition categories: {self packageNameFromPackageDirectory }).
	self addClassAndMethodDefinitionsFromDirectory: packageDirectory.