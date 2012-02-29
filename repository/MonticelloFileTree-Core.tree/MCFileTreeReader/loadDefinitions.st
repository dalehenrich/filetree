
!MCFileTreeReader methodsFor: 'utilities'!
loadDefinitions
    | entries |
    definitions := OrderedCollection new.
    entries := packageDirectory entries.
    [ 
    fileTreeStructureVersion := #'0.0'.
    (entries detect: [ :entry | entry name = '.filetree' ] ifNone: [  ])
        ifNotNil: [ :configEntry | 
            configEntry
                readStreamDo: [ :fileStream | 
                    | jsonObject |
                    [ 
                    fileTreeStructureVersion := ((jsonObject := MCFileTreeJsonParser parseStream: fileStream) isFloat
                        ifTrue: [ jsonObject printShowingDecimalPlaces: 1 ]
                        ifFalse: [ jsonObject at: 'structureVersion' ]) asSymbol ]
                        on: Error
                        do: [ :ex | 
                            Transcript
                                cr;
                                show:
                                        'Error reading package properties (.filetree): ' , packageDirectory pathName , ' :: ' , ex description ] ] ].
    self
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
            inDirectory: packageDirectory;
        addClassAndMethodDefinitionsFromDirectoryEntries: entries;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
            inDirectory: packageDirectory ]
        on: Error
        do: [ :error | error halt ]! !
