
!MCFileTreeAbstractReader methodsFor: 'utilities'!
addClassAndMethodDefinitionsFromDirectoryEntries: entries
    | timestamp |
    self noMethodMetaData
        ifTrue: [ timestamp := self info author , ' ' , self info date mmddyyyy , ' ' , self info time print24 ].
    entries
        do: [ :element | 
            element isDirectory
                ifTrue: [ 
                    | directory |
                    directory := element asFileDirectory.
                    ((self separateMethodMetaAndSource or: [ self noMethodMetaData ])
                        ifTrue: [ directory entries select: [ :entry | entry name endsWith: '.st' ] ]
                        ifFalse: [ directory entries ])
                        do: [ :file | 
                            | methodDefinition |
                            (methodDefinition := self definitionFromFile: file inDirectory: directory)
                                ifNotNil: [ 
                                    methodDefinition isMethodDefinition
                                        ifTrue: [ 
                                            self separateMethodMetaAndSource
                                                ifTrue: [ 
                                                    directory
                                                        fileNamed: methodDefinition selector asString , '.meta'
                                                        do: [ :fileStream | methodDefinition setTimeStamp: (Author fixStamp: fileStream contents) ] ].
                                            self noMethodMetaData
                                                ifTrue: [ methodDefinition setTimeStamp: timestamp ] ].
                                    definitions add: methodDefinition ] ] ] ]! !
