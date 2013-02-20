utilities
definitionFromFile: directoryEntry inDirectory: aDirectory
    | defs reader |
    directoryEntry ifNil: [ ^ nil ].
    self fileUtils
        readStreamFor: directoryEntry name
        in: aDirectory
        do: [ :fileStream | 
            | methodDefinition |
            reader := MCStReader on: fileStream.
            (defs := reader definitions) size <= 1
                ifFalse: [ self error: 'we should be writing exactly 1 definition per file' ] ].
    defs size = 0
        ifTrue: [ ^ nil ].
    ^ defs first