
!MCFileTreeStSnapshotWriter methodsFor: 'visiting'!
visitMethodDefinition: definition
    (self methodDefinitions
        at: definition actualClass
        ifAbsent: [ self methodDefinitions at: definition actualClass put: OrderedCollection new ]) add: definition! !
