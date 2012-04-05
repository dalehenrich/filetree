writing
writeClassDefinition: definition
    stWriter writeClassDefinition: definition.
    definition hasClassInstanceVariables
        ifTrue: [ stWriter writeMetaclassDefinition: definition ].
    definition hasComment
        ifTrue: [ stWriter writeClassComment: definition ]