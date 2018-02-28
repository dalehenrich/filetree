accessing
writeSnapshot: aSnapshot in: aPackagePath
	"Separate the snapshot contents into the various types of definitions we expect."

	| orderedDefinitions extensionClasses extensionMethodDefinitions classDefinitions traitDefinitions methodDefinitions classAndTraitNames |
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
	self outputFileDelete: aPackagePath.
	self writeClassDefinitions: classDefinitions in: aPackagePath.
	self writeTraitDefinitions: traitDefinitions in: aPackagePath.
	self writeMethodDefinitions: methodDefinitions in: aPackagePath.
	self
		writeExtensionMethodDefinitions: extensionMethodDefinitions
		in: aPackagePath