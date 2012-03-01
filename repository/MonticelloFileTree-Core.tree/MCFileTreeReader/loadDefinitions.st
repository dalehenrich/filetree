
!MCFileTreeReader methodsFor: 'utilities'!
loadDefinitions
    | entries |
    definitions := OrderedCollection new.
    entries := packageDirectory entries.
    self
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
            inDirectory: packageDirectory;
        addClassAndMethodDefinitionsFromDirectoryEntries: entries;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
            inDirectory: packageDirectory! !
