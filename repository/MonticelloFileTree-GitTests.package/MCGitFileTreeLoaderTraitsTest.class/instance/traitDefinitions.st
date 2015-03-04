resources
traitDefinitions
	^ {(MCOrganizationDefinition categories: #(#'Cypress-TraitMocks')).
	(MCMethodDefinition
		className: 'GreetingTrait'
		classIsMeta: false
		selector: 'sayHello'
		category: 'as yet unclassified'
		timeStamp: 'topa 7/21/2013 23:49'
		source:
			'sayHello
^''FileTree + Traits = Good Friends''').
	(MCMethodDefinition
		className: 'GreetingTrait'
		classIsMeta: true
		selector: 'bork'
		category: 'as yet unclassified'
		timeStamp: 'topa 7/22/2013 01:10'
		source:
			'bork
^ ''zork zork!''').
	(MCMethodDefinition
		className: 'FooTrait'
		classIsMeta: false
		selector: 'wakkaWakka'
		category: 'as yet unclassified'
		timeStamp: 'topa 7/22/2013 01:43'
		source:
			'wakkaWakka
^ ''Fozzy''').
	(MCClassDefinition
		name: 'TheRandomestObject'
		superclassName: 'Object'
		traitComposition: 'GreetingTrait'
		classTraitComposition: 'GreetingTrait classTrait'
		category: 'Cypress-TraitMocks'
		instVarNames: #()
		classVarNames: #()
		poolDictionaryNames: #()
		classInstVarNames: #()
		type: #normal
		comment: ''
		commentStamp: '').
	(MCClassDefinition
		name: 'TheSecondToRandomestObject'
		superclassName: 'Object'
		traitComposition: 'WavingTrait'
		classTraitComposition: 'WavingTrait classTrait'
		category: 'Cypress-TraitMocks'
		instVarNames: #()
		classVarNames: #()
		poolDictionaryNames: #()
		classInstVarNames: #()
		type: #normal
		comment: ''
		commentStamp: '').
	(MCClassDefinition
		name: 'TheThirdToRandomestObject'
		superclassName: 'Object'
		traitComposition: '{}'
		classTraitComposition: 'GreetingTrait'
		category: 'Cypress-TraitMocks'
		instVarNames: #()
		classVarNames: #()
		poolDictionaryNames: #()
		classInstVarNames: #()
		type: #normal
		comment: ''
		commentStamp: '').
	(MCTraitDefinition
		name: 'FooTrait'
		traitComposition: '{}'
		category: 'Cypress-TraitMocks'
		comment: ''
		commentStamp: '').
	(MCTraitDefinition
		name: 'GreetingTrait'
		traitComposition: '{}'
		category: 'Cypress-TraitMocks'
		comment: ''
		commentStamp: '').
	(MCTraitDefinition
		name: 'WavingTrait'
		traitComposition: 'GreetingTrait'
		category: 'Cypress-TraitMocks'
		comment: ''
		commentStamp: '').
	(MCClassTraitDefinition baseTraitName: 'WavingTrait' classTraitComposition: 'GreetingTrait classTrait + FooTrait')}