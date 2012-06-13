utilities
addMethodDefinitionsForClass: className methodProperties: methodProperties in: entries
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
                                    | category source timestamp selector |
                                    category := fileStream nextLine.
                                    source := fileStream upToEnd.
                                    selector := self methodSelectorFor: source.
                                    timestamp := methodProperties
                                        at:
                                            (classIsMeta
                                                ifTrue: [ 'class' ]
                                                ifFalse: [ 'instance' ])
                                        ifPresent: [ :map | map at: selector asString ifAbsent: [  ] ].	"Issue 33: https://github.com/dalehenrich/filetree/issues/33"
                                    timestamp
                                        ifNil: [ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
                                    definitions
                                        add:
                                            (MCMethodDefinition
                                                className: className
                                                classIsMeta: classIsMeta
                                                selector: selector
                                                category: category
                                                timeStamp: timestamp
                                                source: source) ] ] ] ]