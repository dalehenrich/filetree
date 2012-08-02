visiting
deleteExistingPackageStructureFor: members
    "destroy .tree and .pkg directory structure .. otherwise it won't be pretty"

    | alternateDirName alternateDir |
    self packageFileDirectory exists
        ifTrue: [ self packageFileDirectory deleteAll ].
    alternateDirName := (self packageFileDirectory basename endsWith: '.pkg')
        ifTrue: [ members first , '.tree' ]
        ifFalse: [ 
            (self packageFileDirectory basename endsWith: '.tree')
                ifTrue: [ members first , '.pkg' ]
                ifFalse: [ 
                    (self packageFileDirectory basename endsWith: '.package')
                        ifTrue: [ members first , '.pkg' ] ] ].
    alternateDirName
        ifNotNil: [ 
            alternateDir := stream directory / alternateDirName.
            alternateDir exists
                ifTrue: [ alternateDir deleteAll ] ]