utilities
addClassAndMethodDefinitions
	(self zip members
		select: [ :m | m fileName matchesRegex: packageDirectory , self slash , '[^' , self slash , ']+' , self slash ])
		do: [ :entry | 
			(entry fileName endsWith: '.class' , self slash)
				ifTrue: [ self addClassAndMethodDefinitionsFromEntry: entry ].
			(entry name endsWith: '.extension' , self slash)
				ifTrue: [ self addExtensionClassAndMethodDefinitionsFromEntry: entry ] ]