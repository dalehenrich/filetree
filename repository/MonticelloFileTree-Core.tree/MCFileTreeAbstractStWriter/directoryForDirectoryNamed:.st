
!MCFileTreeAbstractStWriter methodsFor: 'private'!
directoryForDirectoryNamed: directoryName
    ^ directoryName = '.'
        ifTrue: [ stream packageFileDirectory ]
        ifFalse: [ stream subPackageFileDirectoryFor: directoryName ]! !
