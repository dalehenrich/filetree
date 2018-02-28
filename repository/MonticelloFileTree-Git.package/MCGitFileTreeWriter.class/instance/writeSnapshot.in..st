accessing
writeSnapshot: aSnapshot in: aPackagePath
	"Separate the snapshot contents into the various types of definitions we expect."

	| orderedDefinitions extensionClasses extensionMethodDefinitions classDefinitions traitDefinitions methodDefinitions classAndTraitNames organization |
	orderedDefinitions := MCDependencySorter
		sortItems: aSnapshot definitions.
	classDefinitions := orderedDefinitions
		select: [ :e | e isKindOf: MCClassDefinition ].
	traitDefinitions := orderedDefinitions
		select: [ :e | 
			(e isKindOf: MCTraitDefinition)
				or: [ e isKindOf: MCClassTraitDefinition ] ].
	classAndTraitNames := (classDefinitions , traitDefinitions
		collect: [ :e | e className ]) asSet.
	methodDefinitions := orderedDefinitions
		select: [ :e | 
			(e isKindOf: MCMethodDefinition)
				and: [ classAndTraitNames includes: e className ] ].
	extensionMethodDefinitions := orderedDefinitions
		select: [ :e | 
			(e isKindOf: MCMethodDefinition)
				and: [ (classAndTraitNames includes: e className) not ] ].
	organization := orderedDefinitions
		select: [ :e | e isKindOf: MCOrganizationDefinition ].
	extensionClasses := (extensionMethodDefinitions
		collect: [ :e | e className ]) asSet.
	self outputFileDelete: aPackagePath.
	self writePackageGitPropertiesIn: aPackagePath.
	self writeOrganization: organization in: aPackagePath.
	self writeClassDefinitions: classDefinitions in: aPackagePath.
	self writeTraitDefinitions: traitDefinitions in: aPackagePath.
	self writeMethodDefinitions: methodDefinitions in: aPackagePath.
	self
		writeExtensionClassDefinitions: extensionClasses
		in: aPackagePath.
	self
		writeExtensionMethodDefinitions: extensionMethodDefinitions
		in: aPackagePath.
	self writeInitializers: methodDefinitions in: aPackagePath