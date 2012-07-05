utility
getMczTestRepository: repositoryName
    | repo |
    repo := MCDirectoryRepository new directory: (self getTestRepositoriesDirectory directoryNamed: repositoryName).
    ^ MCRepositoryGroup default repositories detect: [ :each | each = repo ] ifNone: [ repo ]