utilities
loadDefinitions
	| entries directory |
	definitions := OrderedCollection new.
	directory := self packageDirectory / self monticelloMetaDirName.

	directory exists
		ifFalse: [ ^ self addClassAndMethodDefinitionsFromDirectory: self packageDirectory].
		
	entries := directory entries.
	self
		addDefinitionFromFile: (entries detect: [ :entry | entry basename beginsWith: 'categories' ] ifNone: [  ])
		inDirectory: directory.
	self addClassAndMethodDefinitionsFromDirectory: self packageDirectory.
	self
		addDefinitionFromFile: (entries detect: [ :entry | entry basename beginsWith: 'initializers' ] ifNone: [  ])
		inDirectory: directory