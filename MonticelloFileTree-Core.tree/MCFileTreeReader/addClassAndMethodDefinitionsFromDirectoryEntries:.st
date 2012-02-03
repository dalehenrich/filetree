
!MCFileTreeReader methodsFor: 'utilities'!
addClassAndMethodDefinitionsFromDirectoryEntries: entries
    entries
        do: [ :element | 
            element isDirectory
                ifTrue: [ 
                    | directory |
                    directory := packageDirectory directoryNamed: element name.
                    (self separateMethodMetaAndSource
                        ifTrue: [ directory entries select: [ :entry | entry name endsWith: '.st' ] ]
                        ifFalse: [ directory entries ])
                        do: [ :file | 
                            | methodDefinition |
                            methodDefinition := self definitionFromFile: file inDirectory: directory.
                            (self separateMethodMetaAndSource and: [ methodDefinition isMethodDefinition ])
                                ifTrue: [ 
                                    directory
                                        fileNamed: methodDefinition selector asString , '.meta'
                                        do: [ :fileStream | methodDefinition setTimeStamp: (Author fixStamp: fileStream contents) ] ].
                            definitions add: methodDefinition ] ] ]! !
