
!MCFileTreeRepository methodsFor: 'accessing'!
repositoryProperties
    repositoryProperties
        ifNil: [ 
            repositoryProperties := Dictionary new.
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
    ^ repositoryProperties! !
