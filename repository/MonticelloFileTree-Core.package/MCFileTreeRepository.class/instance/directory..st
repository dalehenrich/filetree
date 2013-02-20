as yet unclassified
directory: aDirectory
    super directory: aDirectory.
    self repositoryProperties isEmpty
        ifTrue: [ 
            (self fileUtils directoryExists: aDirectory)
                ifTrue: [ self writeRepositoryProperties ] ]