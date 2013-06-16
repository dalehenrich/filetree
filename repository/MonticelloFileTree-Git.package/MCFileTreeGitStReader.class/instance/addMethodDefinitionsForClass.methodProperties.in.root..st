utilities
addMethodDefinitionsForClass: className methodProperties: methodProperties in: entries root: aClassEntry
	(entries
		select: [ :entry | entry fileName matchesRegex: aClassEntry fileName , '((class)|(instance))' , self slash , '[^' , self slash , ']+.st' ])
		do: [ :methodEntry | 
			| classIsMeta fileStream category source timestamp selector |
			classIsMeta := false.
			(methodEntry fileName beginsWith: aClassEntry fileName , 'class' , self slash)
				ifTrue: [ classIsMeta := true ].
			fileStream := ReadStream on: methodEntry contents.
			category := fileStream nextLine.
			source := fileStream upToEnd.
			selector := self methodSelectorFor: source.
			timestamp := methodProperties
				at:
					(classIsMeta
						ifTrue: [ 'class' ]
						ifFalse: [ 'instance' ])
				ifPresent: [ :map | map at: selector asString ifAbsent: [  ] ].	"Issue 33: https://github.com/dalehenrich/filetree/issues/33"
			timestamp ifNil: [ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
			definitions
				add:
					(MCMethodDefinition
						className: className
						classIsMeta: classIsMeta
						selector: selector
						category: category
						timeStamp: timestamp
						source: source) ]