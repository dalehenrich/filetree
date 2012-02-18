
!MCFileTreeStWriter methodsFor: 'initialize-release'!
writeDefinitions: aCollection
    "the correct initialization order is unknown if some classes are missing in the image"

    [ 
    self writeConfigFile.
    stWriter acceptVisitor: self forDefinitions: aCollection.
    self writeInitializers ]
        on: Error
        do: [ :ex | ex halt ]! !
