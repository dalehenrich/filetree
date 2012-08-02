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
            (self directory entries detect: [ :entry | entry basename = '.filetree' ] ifNone: [  ])
                ifNotNil: [ :configEntry | 
                    configEntry asFileReference 
                        readStreamDo: [ :fileStream | 
                            [ repositoryProperties := MCFileTreeJsonParser parseStream: fileStream ]
                                on: Error
                                do: [ :ex | 
                                    Transcript
                                        cr;
                                        show:
                                                'Error reading repository properties (.filetree): ' , self directory fullName  , ' :: ' , ex description ] ] ] ].
    ^ repositoryProperties