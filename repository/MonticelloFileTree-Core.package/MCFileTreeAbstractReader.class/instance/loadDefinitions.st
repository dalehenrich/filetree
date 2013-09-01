utilities
loadDefinitions
    | entries |
    definitions := OrderedCollection new.
    entries := packageDirectory entries.
    self
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'categories' ] ifNone: [  ])
            inDirectory: packageDirectory;
        addClassAndMethodDefinitionsFromDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'initializers' ] ifNone: [  ])
            inDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | 
              (entry name beginsWith: 'preamble') and: [
	        (entry name includesSubstring: 'OfRemoval' caseSensitive: true) not] ] ifNone: [  ])
            inDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry |
              (entry name beginsWith: 'postscript') and: [
	        (entry name includesSubstring: 'OfRemoval' caseSensitive: true) not] ] ifNone: [  ])
            inDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'preambleOfRemoval' ] ifNone: [  ])
            inDirectory: packageDirectory;
        addDefinitionFromFile: (entries detect: [ :entry | entry name beginsWith: 'postscriptOfRemoval' ] ifNone: [  ])
            inDirectory: packageDirectory.
