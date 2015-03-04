adding
addClassAndMethodDefinitionsFromDirectory: aDirectory
	self flag: 'rename? loadPackageDirectory:'.
	aDirectory entries do:
		[ :entry | 
 			(entry name endsWith: '.trait')
				ifTrue: [ self addTraitAndMethodDefinitionsFromEntry: entry ].
			(entry name endsWith: '.class')
				ifTrue: [ self addClassAndMethodDefinitionsFromEntry: entry ].
			(entry name endsWith: '.extension')
				ifTrue: [ self addExtensionClassAndMethodDefinitionsFromEntry: entry ] ]