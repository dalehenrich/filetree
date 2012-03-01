
!MCFileTreeStSnapshotWriter methodsFor: 'visiting'!
visitClassDefinition: definition
    orderedClassNames add: definition className.
    self classDefinitions at: definition actualClass put: definition! !
