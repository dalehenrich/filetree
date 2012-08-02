utilities
addClassAndMethodDefinitionsFromDirectory: aDirectory
    aDirectory entries
        do: [ :entry | 
            (entry basename endsWith: '.class')
                ifTrue: [ self addClassAndMethodDefinitionsFromEntry: entry ].
            (entry basename endsWith: '.extension')
                ifTrue: [ self addExtensionClassAndMethodDefinitionsFromEntry: entry ] ]