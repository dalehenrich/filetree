
!MCFileTreeStWriter methodsFor: 'visiting'!
visitMethodDefinition: definition
    | filename directoryname |
    directoryname := definition classIsMeta
        ifTrue: [ definition className , '_class' ]
        ifFalse: [ definition className ].
    filename := definition selector == #'/'
        ifTrue: [ 'encoded slash' ]
        ifFalse: [ definition selector ].
    self
        writeInDirectoryName: directoryname
        fileName: filename
        extension: '.st'
        visit: [ stWriter visitMethodDefinition: definition ]! !
