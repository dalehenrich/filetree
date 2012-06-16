accessing
repositoryProperties
    repositoryProperties
        ifNil: [ 
            repositoryProperties := Dictionary new.
            self directory exists
                ifFalse: [ 
                    Transcript
                        cr;
                        show: 'filetree:// repository ' , self directory pathName printString , ' does not exist.'.
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
                                                'Error reading repository properties (.filetree): ' , self directory pathName , ' :: ' , ex description ] ] ] ].
    ^ repositoryProperties