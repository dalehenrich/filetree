as yet unclassified
directory: aDirectory
    super directory: aDirectory.
    self repositoryProperties isEmpty
        ifTrue: [ 
            aDirectory exists
                ifTrue: [ self writeRepositoryProperties ] ]