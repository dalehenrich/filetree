
!MCFileTreeStCypressReader methodsFor: 'utilities'!
loadDefinitions
    | entries directory |
    definitions := OrderedCollection new.
    directory := packageDirectory directoryNamed: self monticelloMetaDirName.
    entries := directory entries.
    self
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
            inDirectory: directory;
        addClassAndMethodDefinitionsFromDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
            inDirectory: directory! !
