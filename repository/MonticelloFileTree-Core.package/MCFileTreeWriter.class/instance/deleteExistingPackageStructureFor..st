visiting
deleteExistingPackageStructureFor: members
    "destroy .tree and .pkg directory structure .. otherwise it won't be pretty"

    | alternateDirName alternateDir |
    self packageFileDirectory exists
        ifTrue: [ self packageFileDirectory recursiveDelete ].
    alternateDirName := (self packageFileDirectory localName endsWith: '.pkg')
        ifTrue: [ members first , '.tree' ]
        ifFalse: [ 
            (self packageFileDirectory localName endsWith: '.tree')
                ifTrue: [ members first , '.pkg' ]
                ifFalse: [ 
                    (self packageFileDirectory localName endsWith: '.package')
                        ifTrue: [ members first , '.pkg' ] ] ].
    alternateDirName
        ifNotNil: [ 
            alternateDir := stream directory directoryNamed: alternateDirName.
            alternateDir exists
                ifTrue: [ alternateDir recursiveDelete ] ]