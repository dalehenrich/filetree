private
targetDefinitions
    "remove #extra method and modify #name: method"

    | className |
    className := 'CypressMockBasic'.
    ^ {(MCClassDefinition
        name: className
        superclassName: 'Object'
        category: 'Cypress-Mocks'
        instVarNames: #('name')
        classVarNames: #()
        poolDictionaryNames: #()
        classInstVarNames: #('current')
        comment: 'This mock contains basic class and instance method selectors').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'added'
        category: 'accessing'
        timeStamp: ''
        source: 'added
	"added method"').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'initialize'
        category: 'initialization'
        timeStamp: ''
        source: 'initialize
	super initialize.
	self name: ''Unknown''').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'name'
        category: 'accessing'
        timeStamp: ''
        source: 'name
	^name').
    (MCMethodDefinition
        className: className
        classIsMeta: false
        selector: 'name:'
        category: 'accessing'
        timeStamp: ''
        source: 'name: aString
	"changed method"
	name := aString').
    (MCMethodDefinition
        className: className
        classIsMeta: true
        selector: 'current'
        category: 'accessing'
        timeStamp: ''
        source: 'current
	^current').
    (MCMethodDefinition
        className: className
        classIsMeta: true
        selector: 'current:'
        category: 'accessing'
        timeStamp: ''
        source: 'current: anObject
	current := anObject').
    (MCMethodDefinition
        className: className
        classIsMeta: true
        selector: 'initialize'
        category: 'initialization'
        timeStamp: ''
        source: 'initialize
	self current: self new')}