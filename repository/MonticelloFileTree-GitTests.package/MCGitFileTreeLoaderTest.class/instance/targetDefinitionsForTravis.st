utility
targetDefinitionsForTravis
	| className timestamp classDefinition |
	classDefinition := self standardClassDefinition: 'CypressMockBasic'.
	className := classDefinition className.
	timestamp := 'DaleHenrichs ' , (self conditionTimestamp: '28/6/2012 3:07:37').
	^ {(MCOrganizationDefinition categories: #('Cypress-Mocks')).
	classDefinition.
	(MCMethodDefinition
		className: className
		classIsMeta: false
		selector: 'added'
		category: 'accessing'
		timeStamp: timestamp
		source:
			'added
    "added method"').
	(MCMethodDefinition
		className: className
		classIsMeta: false
		selector: 'initialize'
		category: 'initialization'
		timeStamp: timestamp
		source:
			'initialize
	super initialize.
	self name: ''Unknown''').
	(MCMethodDefinition
		className: className
		classIsMeta: false
		selector: 'name'
		category: 'accessing'
		timeStamp: timestamp
		source:
			'name
	^name').
	(MCMethodDefinition
		className: className
		classIsMeta: false
		selector: 'name:'
		category: 'accessing'
		timeStamp: timestamp
		source:
			'name: aString
    "changed method"

    name := aString').
	(MCMethodDefinition
		className: className
		classIsMeta: true
		selector: 'current'
		category: 'accessing'
		timeStamp: timestamp
		source:
			'current
	^current').
	(MCMethodDefinition
		className: className
		classIsMeta: true
		selector: 'current:'
		category: 'accessing'
		timeStamp: timestamp
		source:
			'current: anObject
	current := anObject').
	(MCMethodDefinition
		className: className
		classIsMeta: true
		selector: 'initialize'
		category: 'initialization'
		timeStamp: timestamp
		source:
			'initialize
	self current: self new')}