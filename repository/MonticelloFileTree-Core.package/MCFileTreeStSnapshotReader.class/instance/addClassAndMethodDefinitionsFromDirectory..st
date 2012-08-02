utilities
addClassAndMethodDefinitionsFromDirectory: aDirectory
    | snapshot classes entries extensions |
    snapshot := aDirectory / 'snapshot'.
    classes := snapshot / 'classes'.
    classes exists
        ifTrue: [ 
            self addClassAndMethodDefinitionsFromDirectoryEntries: (entries := classes entries).	"load .st files from subdirectories (*.class) of snapshot/classes ... class defintions"
            entries
                do: [ :classDirectoryEntry | 
                    | classDirectory |
                    classDirectory := classDirectoryEntry asFileReference.
                    self addClassAndMethodDefinitionsFromDirectoryEntries: classDirectory entries	"load .st files from subdirectories (class or instance) of snapshot/classes/*.class ... method definitions" ] ].
    extensions := snapshot / 'extensions'.
    extensions exists
        ifTrue: [ 
           extensions entries
                do: [ :classDirectoryEntry | 
                    | classDirectory |
                    classDirectory := classDirectoryEntry asFileReference.
                    self addClassAndMethodDefinitionsFromDirectoryEntries: classDirectory entries	"load .st files from subdirectories (class or instance) of snapshot/extensions/*.class ... method definitions" ] ].
