accessing
fileNameForSelector: selector
  ^ (selector includes: $:)
    ifTrue: [ 
      selector
        collect: [ :each | 
          each = $:
            ifTrue: [ $. ]
            ifFalse: [ each ] ] ]
    ifFalse: [ 
      (self specials includes: selector first)
        ifFalse: [ selector ]
        ifTrue: [ 
          | output specialCharacters |
          specialCharacters := self specials.
          output := String new writeStream.
          output nextPut: $^.
          selector
            do: [ :each | 
              output
                nextPutAll:
                  ((specialCharacters includes: each)
                    ifTrue: [ specialCharacters at: each ]
                    ifFalse: [ each asString ]) ]
            separatedBy: [ output nextPut: $. ].
          output contents ] ]
