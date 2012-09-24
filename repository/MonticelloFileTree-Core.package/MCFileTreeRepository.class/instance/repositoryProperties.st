accessing
repositoryProperties
    repositoryProperties
        ifNil: [ 
            repositoryProperties := Dictionary new.
            (self fileUtils directoryExists: directory)
                ifFalse: [ 
                    Transcript
                        cr;
                        show:
                                'filetree:// repository ' , (self fileUtils directoryPathString: self directory) printString , ' does not exist.'.
                    ^ repositoryProperties ].
            (self directory entries detect: [ :entry | entry name = '.filetree' ] ifNone: [  ])
                ifNotNil: [ :configEntry | 
                    configEntry
                        readStreamDo: [ :fileStream | 
                            [ repositoryProperties := MCFileTreeJsonParser parseStream: fileStream ]
                                on: Error
                                do: [ :ex | 
                                    Transcript
                                        cr;
                                        show:
                                                'Error reading repository properties (.filetree): ' , (self fileUtils directoryPathString: self directory) , ' :: '
                                                        , ex description ] ] ] ].
    ^ repositoryProperties