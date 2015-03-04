loading
loadMethodDefinitionForClass: className properties: methodProperties extension: extensionMethod meta: classIsMeta fromEntry: methodEntry
	| category source timestamp selector |
	methodEntry readStreamDo: [ :fileStream |
		category := fileStream
			nextLine; "skip quote on line 1"
			nextLine; "skip copyright notice on line 2"
			upTo: Character space; "skip 'category: ' line prefix"
			nextLine. "and that's how you do parsing... NOT"
		fileStream nextLine. "don't forget the closing quote on line 4"
		source := fileStream upToEnd ].
	
	selector := self methodSelectorFor: source.
	timestamp := methodProperties
		at: (classIsMeta ifTrue: [ 'class' ] ifFalse: [ 'instance' ])
		ifPresent: [ :map | map at: selector asString ifAbsent: [  ] ].	"Issue 33: https://github.com/dalehenrich/filetree/issues/33"
	timestamp ifNil:
		[ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
"	extensionMethod ifTrue:
		[ self validateExtensionMethodCategory: category for: className selector: selector ]."
			
	^ MCMethodDefinition
		className: className
		classIsMeta: classIsMeta
		selector: selector
		category: category
		timeStamp: timestamp
		source: source