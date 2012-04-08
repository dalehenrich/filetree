utilities
addMethodDefinitionsForClass: className in: entries
    entries
        do: [ :entry | 
            | classIsMeta |
            classIsMeta := false.
		entry name = 'class'
                ifTrue: [ classIsMeta := true ].
            (entry name = 'instance' or: [ entry name = 'class' ])
                ifTrue: [ 
                    (entry asFileDirectory entries select: [ :each | each name endsWith: '.st' ])
                        do: [ :methodEntry | 
                            methodEntry
                                readStreamDo: [ :fileStream | 
                                    | category source timestamp |
                                    category := fileStream nextLine decodeFromUTF8.
						category := category copyFrom: 1 to: category size - 1. "remove newline"
                                    source := fileStream upToEnd decodeFromUTF8.
                                    timestamp := self info author , ' ' , self info date mmddyyyy , ' '
                                        , self info time print24.
                                    definitions
                                        add:
                                            (MCMethodDefinition
                                                className: className
                                                classIsMeta: classIsMeta
                                                selector: (self methodSelectorFor: source)
                                                category: category
                                                timeStamp: timestamp
                                                source: source) ] ] ] ]