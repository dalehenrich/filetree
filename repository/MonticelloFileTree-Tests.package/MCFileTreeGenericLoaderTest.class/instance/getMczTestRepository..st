utility
getMczTestRepository: repositoryName
    | dir repo |
    dir := utilityClass directoryFromPath: repositoryName relativeTo: self getTestRepositoriesDirectory.
    repo := MCDirectoryRepository new directory: dir.
    ^ MCRepositoryGroup default repositories detect: [ :each | each = repo ] ifNone: [ repo ]