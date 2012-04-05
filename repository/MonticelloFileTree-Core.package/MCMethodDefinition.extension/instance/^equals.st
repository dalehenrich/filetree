*monticellofiletree-core
= aDefinition
    ^ super = aDefinition
        and: [ 
            aDefinition source = self source
                and: [ 
                    aDefinition category = self category
                        and: [ 
                            "for now we'll ignore the timestamp in regards to method equality"
                            true
                                ifTrue: [ true ]
                                ifFalse: [ aDefinition timeStamp = self timeStamp ] ] ] ]