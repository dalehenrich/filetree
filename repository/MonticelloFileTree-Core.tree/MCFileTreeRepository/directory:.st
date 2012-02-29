
!MCFileTreeRepository methodsFor: 'as yet unclassified'!
directory: aDirectory
    super directory: aDirectory.
    self repositoryProperties isEmpty
        ifTrue: [ self writeRepositoryProperties ]! !
