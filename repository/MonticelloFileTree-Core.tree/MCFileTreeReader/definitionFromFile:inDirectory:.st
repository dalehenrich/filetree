
!MCFileTreeReader methodsFor: 'utilities'!
definitionFromFile: directoryEntry inDirectory: aDirectory
    | defs reader |
    directoryEntry ifNil: [ ^ nil ].
    aDirectory
        fileNamed: directoryEntry name
        do: [ :fileStream | 
            | methodDefinition |
            reader := MCStReader on: fileStream.
            (defs := reader definitions) size <= 1
                ifFalse: [ 'we are attempting to write exactly 1 definition per file' halt ] ].
    defs size = 0
        ifTrue: [ ^ nil ].
    ^ defs first! !
