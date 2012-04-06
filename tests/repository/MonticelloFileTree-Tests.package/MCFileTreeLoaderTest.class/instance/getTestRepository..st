utility
getTestRepository: repositoryName
    | repo |
    repo := MCFileTreeRepository new directory: (self getTestRepositoriesDirectory directoryNamed: repositoryName).
    ^ MCRepositoryGroup default repositories detect: [ :each | each = repo ] ifNone: [ repo ]