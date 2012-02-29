
!MCFileTreeAbstractStWriter methodsFor: 'visiting'!
writeInDirectoryName: directoryName fileName: fileName extension: ext visit: visitBlock
    | directory |
    directory := self directoryForDirectoryNamed: directoryName.
    directory
        forceNewFileNamed: fileName , ext
        do: [ :file | 
            file lineEndConvention: #'lf'.
            stWriter stream: file.
            visitBlock value ]! !
