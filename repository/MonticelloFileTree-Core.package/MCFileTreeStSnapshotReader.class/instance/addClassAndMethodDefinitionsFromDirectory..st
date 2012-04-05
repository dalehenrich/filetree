utilities
addClassAndMethodDefinitionsFromDirectory: aDirectory
    | snapshot classes entries extensions |
    snapshot := aDirectory directoryNamed: 'snapshot'.
    classes := snapshot directoryNamed: 'classes'.
    classes exists
        ifTrue: [ 
            self addClassAndMethodDefinitionsFromDirectoryEntries: (entries := classes entries).	"load .st files from subdirectories (*.class) of snapshot/classes ... class defintions"
            entries
                do: [ :classDirectoryEntry | 
                    | classDirectory |
                    classDirectory := classDirectoryEntry asFileDirectory.
                    self addClassAndMethodDefinitionsFromDirectoryEntries: classDirectory entries	"load .st files from subdirectories (class or instance) of snapshot/classes/*.class ... method definitions" ] ].
    extensions := snapshot directoryNamed: 'extensions'.
    extensions exists
        ifTrue: [ 
           extensions entries
                do: [ :classDirectoryEntry | 
                    | classDirectory |
                    classDirectory := classDirectoryEntry asFileDirectory.
                    self addClassAndMethodDefinitionsFromDirectoryEntries: classDirectory entries	"load .st files from subdirectories (class or instance) of snapshot/extensions/*.class ... method definitions" ] ].
