A MCFileTreeLoaderTraitsTest tests the Loading of Traits with filetree.

generation of the definiton:

[ | defs methds orga  cls trt clstrt|
defs := ((PackageInfo named: 'Cypress-TraitMocks') mcPackage snapshot definitions).
orga := (defs select: [:d | d isOrganizationDefinition]) collect: [:d | '(MCOrganizationDefinition categories: {1})' format: { d categories printString }].
methds := (defs select: [:d| d isMethodDefinition]) collect: [ :d |
		'(MCMethodDefinition
        className: ''{1}''
        classIsMeta: {2}
        selector: ''{3}''
        category: ''{4}''
        timeStamp: ''{5}''
        source:
            {6})' 
			format:
		{ d className . d classIsMeta . d selector asString. d category asString . d timeStamp . d source printString }].
cls := (defs select: [:d| d isClassDefinition and: [(d isKindOf: MCTraitDefinition) not]]) collect: [:d|
	'(MCClassDefinition
        name: {1}
        superclassName: {2}
        traitComposition: {3}
        classTraitComposition: {4}
        category: {5}
        instVarNames: {6}
        classVarNames: {7}
        poolDictionaryNames: {8}
        classInstVarNames: {9}
        type: {10}
        comment: {11}
        commentStamp: {12})' format:
	{ d className asString printString. d superclassName asString printString . d traitCompositionString printString . d classTraitCompositionString printString .
	  d category printString . d instVarNames asArray printString . d classVarNames asArray printString . 
	  d poolDictionaries asArray printString. d classInstVarNames asArray printString . d type printString . d comment printString . d commentStamp printString }].
trt := (defs select: [:d| d isKindOf: MCTraitDefinition]) collect: [:d|
	'(MCTraitDefinition
        name: {1}
        traitComposition: {2}
        category: {3}
        comment: {4}
        commentStamp: {5})' format:
	{ d className asString printString. d traitCompositionString printString . 
	  d category printString .  d comment printString . d commentStamp printString }].
clstrt :=  (defs select: [:d| d isKindOf: MCClassTraitDefinition]) collect: [:d|
	'(MCClassTraitDefinition
        baseTraitName: {1}
        classTraitComposition: {2})' format:
	{ d className asString printString. d classTraitCompositionString printString . }].
String streamContents: [:s |
	s nextPutAll: 'traitDefinitions'; cr;cr; nextPutAll: '    ^ {'.
	(orga, methds, cls, trt, clstrt) do: [:def| s nextPutAll: def ] separatedBy: [s nextPut: $.; cr; nextPutAll: '    '].
	s nextPut: $}; cr].
] value in: [:string | MCFileTreeLoaderTraitsTest compile: string classified: 'private']