utilities
loadDefinitions
	"Query the zip archive for the relevant data."

	| query |
	definitions := OrderedCollection new.
	query := self zip
		membersMatching: packageDirectory , self slash , self monticelloMetaDirName , self slash , 'categories*'.
	query notEmpty
		ifTrue: [ self addDefinitionFromEntry: query first ]
		ifFalse: [ definitions add: (MCOrganizationDefinition categories: {(self packageNameFromPackageDirectory)}) ].
	self addClassAndMethodDefinitions.
	query := self zip
		membersMatching: packageDirectory , self slash , self monticelloMetaDirName , self slash , 'initializers*'.
	query notEmpty
		ifTrue: [ self addDefinitionFromEntry: query first ]