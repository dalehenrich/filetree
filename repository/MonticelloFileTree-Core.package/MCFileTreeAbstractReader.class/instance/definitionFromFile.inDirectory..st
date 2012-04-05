utilities
definitionFromFile: directoryEntry inDirectory: aDirectory
    | defs reader |
    directoryEntry ifNil: [ ^ nil ].
    aDirectory
        fileNamed: directoryEntry name
        do: [ :fileStream | 
            | methodDefinition |
            reader := MCStReader on: fileStream.
            (defs := reader definitions) size <= 1
                ifFalse: [ self error: 'we should be writing exactly 1 definition per file' ] ].
    defs size = 0
        ifTrue: [ ^ nil ].
    ^ defs first