private
fileNameForSelector: selector
    ^ selector last = $:
        ifTrue: [ 
            selector
                collect: [ :each | 
                    each = $:
                        ifTrue: [ $. ]
                        ifFalse: [ each ] ] ]
        ifFalse: [ 
            selector first isLetter
                ifTrue: [ selector ]
                ifFalse: [ 
                    | output specials |
                    specials := self class specials.
                    output := String new writeStream.
                    output nextPut: $^.
                    selector do: [ :each | output nextPutAll: (specials at: each) ] separatedBy: [ output nextPut: $. ].
                    output contents ] ]