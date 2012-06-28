utilities
loadDefinitions
    | entries directory |
    definitions := OrderedCollection new.
    directory := packageDirectory directoryNamed: self monticelloMetaDirName.
    directory exists
        ifTrue: [ 
            entries := directory entries.
            self
                addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
                inDirectory: directory ].
    self addClassAndMethodDefinitionsFromDirectory: packageDirectory.
    directory exists
        ifTrue: [ 
            self
                addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
                inDirectory: directory ]