
!MCFileTreeAbstractStWriter class methodsFor: 'writing'!
on: aStream
    ^ (MCFileTreePackageStructureStWriter useSnapShotWriter
        ifTrue: [ MCFileTreeStSnapshotWriter ]
        ifFalse: [ MCFileTreeStWriter ]) new stream: aStream! !
