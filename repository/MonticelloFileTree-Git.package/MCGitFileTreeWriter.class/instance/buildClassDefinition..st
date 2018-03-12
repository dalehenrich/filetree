private-converting
buildClassDefinition: aMCClassDefinition
	| properties |
	properties := Dictionary new.
	properties at: 'name' put: aMCClassDefinition className.
	properties at: 'super' put: aMCClassDefinition superclassName.
	aMCClassDefinition traitCompositionString
		ifNotNil: [ :property | 
			"Issue #48: https://github.com/dalehenrich/filetree/issues/48"
			property ~= '{}'
				ifTrue: [ properties at: 'traitcomposition' put: property ] ].
	aMCClassDefinition classTraitCompositionString
		ifNotNil: [ :property | 
			"Issue #48: https://github.com/dalehenrich/filetree/issues/48"
			property ~= '{}'
				ifTrue: [ properties at: 'classtraitcomposition' put: property ] ].
	properties at: 'category' put: aMCClassDefinition category.
	properties
		at: 'instvars'
		put: aMCClassDefinition instVarNames asArray.
	properties
		at: 'classvars'
		put: aMCClassDefinition classVarNames asArray.
	properties
		at: 'pools'
		put: aMCClassDefinition poolDictionaries asArray.
	properties
		at: 'classinstvars'
		put: aMCClassDefinition classInstVarNames asArray.
	properties at: 'type' put: aMCClassDefinition type asString.
	properties at: 'commentStamp' put: aMCClassDefinition commentStamp.
	^ (String
		streamContents: [ :s | STON put: properties asJsonOnStreamPretty: s ])
		withUnixLineEndings