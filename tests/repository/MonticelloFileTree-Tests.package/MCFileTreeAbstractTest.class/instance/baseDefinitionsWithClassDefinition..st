private
baseDefinitionsWithClassDefinition: classDefinition
    | className |
    className := classDefinition className.
    ^ {(MCOrganizationDefinition categories: #('Cypress-Mocks')).
    classDefinition.
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'extra'
        category: 'accessing'
        timeStamp: ''
        source:
            'extra
	"extra method"').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'initialize'
        category: 'initialization'
        timeStamp: ''
        source:
            'initialize
	super initialize.
	self name: ''Unknown''').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'name'
        category: 'accessing'
        timeStamp: ''
        source:
            'name
	^name').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'name:'
        category: 'accessing'
        timeStamp: ''
        source:
            'name: aString
	name := aString').
    (MCMethodDefinition
        className: className
        classIsMeta: true
        selector: 'current'
        category: 'accessing'
        timeStamp: ''
        source:
            'current
	^current').
    (MCMethodDefinition
        className: className
        classIsMeta: true
        selector: 'current:'
        category: 'accessing'
        timeStamp: ''
        source:
            'current: anObject
	current := anObject').
    (MCMethodDefinition
        className: className
        classIsMeta: true
        selector: 'initialize'
        category: 'initialization'
        timeStamp: ''
        source:
            'initialize
	self current: self new').
    (MCMethodDefinition
        className: 'Object'
        classIsMeta: false
        selector: 'isCypressMockBasic'
        category: '*Cypress-Mocks'
        timeStamp: ''
        source:
            'isCypressMockBasic
	^false')}