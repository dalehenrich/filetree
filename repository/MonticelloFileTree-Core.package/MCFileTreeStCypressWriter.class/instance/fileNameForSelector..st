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
      (self class specials includes: selector first)
        ifFalse: [ selector ]
        ifTrue: [ 
          | output specials |
          specials := self class specials.
          output := String new writeStream.
          output nextPut: $^.
          selector
            do: [ :each | 
              output
                nextPutAll:
                  ((specials includes: each)
                    ifTrue: [ specials at: each ]
                    ifFalse: [ each asString ]) ]
            separatedBy: [ output nextPut: $. ].
          output contents ] ]