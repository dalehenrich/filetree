accessing
repositoryProperties
    repositoryProperties
        ifNil: [ 
            repositoryProperties := Dictionary new.
            directory exists
                ifFalse: [ 
                    Transcript
                        cr;
                        show: 'filetree:// repository ' , directory pathName printString , ' does not exist.'.
                    ^ repositoryProperties ].
            (directory entries detect: [ :entry | entry name = '.filetree' ] ifNone: [  ])
                ifNotNil: [ :configEntry | 
                    configEntry
                        readStreamDo: [ :fileStream | 
                            [ repositoryProperties := MCFileTreeJsonParser parseStream: fileStream ]
                                on: Error
                                do: [ :ex | 
                                    Transcript
                                        cr;
                                        show:
                                                'Error reading repository properties (.filetree): ' , directory pathName , ' :: ' , ex description ] ] ] ].
    ^ repositoryProperties