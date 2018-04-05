accessing
writeSnapshot: aSnapshot in: aPackagePath
	"Separate the snapshot contents into the various types of definitions we expect."

	| orderedDefinitions extensionClasses extensionMethodDefinitions classDefinitions traitDefinitions methodDefinitions classAndTraitNames organization |
	[ :job | 
	job title: 'Building snapshot'.
	orderedDefinitions := MCDependencySorter
		sortItems: aSnapshot definitions.
	job progress: 0.1.
	classDefinitions := orderedDefinitions
		select: [ :e | e class == MCClassDefinition ].
	traitDefinitions := orderedDefinitions
		select: [ :e | 
			(e class == MCTraitDefinition)
				or: [ e class == MCClassTraitDefinition ] ].
	classAndTraitNames := (classDefinitions , traitDefinitions
		collect: [ :e | e className ]) asSet.
	job progress: 0.2.
	methodDefinitions := orderedDefinitions
		select: [ :e | 
			(e class == MCMethodDefinition)
				and: [ classAndTraitNames includes: e className ] ].
	extensionMethodDefinitions := orderedDefinitions
		select: [ :e | 
			(e class == MCMethodDefinition)
				and: [ (classAndTraitNames includes: e className) not ] ].
	organization := orderedDefinitions
		select: [ :e | e class == MCOrganizationDefinition ].
	extensionClasses := (extensionMethodDefinitions
		collect: [ :e | e className ]) asSet.
	job progress: 0.3.
	self outputFileDelete: aPackagePath.
	self writePackageGitPropertiesIn: aPackagePath.
	self writeOrganization: organization in: aPackagePath.
	job progress: 0.4.
	self writeClassDefinitions: classDefinitions in: aPackagePath.
	self writeTraitDefinitions: traitDefinitions in: aPackagePath.
	job progress: 0.5.
	self writeMethodDefinitions: methodDefinitions in: aPackagePath.
	job progress: 0.6.
	self
		writeExtensionClassDefinitions: extensionClasses
		in: aPackagePath.
	self
		writeExtensionMethodDefinitions: extensionMethodDefinitions
		in: aPackagePath.
	job progress: 0.7.
	self writeInitializers: methodDefinitions in: aPackagePath ] asJob
		run