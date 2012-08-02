utilities
loadDefinitions
    | entries |
    definitions := OrderedCollection new.
    entries := self packageDirectory entries.
    self
        addDefinitionFromFile: (entries detect: [ :entry | entry basename beginsWith: 'categories' ] ifNone: [  ])
            inDirectory: self packageDirectory;
        addClassAndMethodDefinitionsFromDirectory: self packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | entry basename beginsWith: 'initializers' ] ifNone: [  ])
            inDirectory: self packageDirectory