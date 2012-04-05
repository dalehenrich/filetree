visiting
subPackageFileDirectoryFor: directoryNameOrPath
    ^ cachedPackageFileDirectoryEntries
        at: directoryNameOrPath
        ifAbsentPut: [ 
            | dir |
            dir := self packageFileDirectory directoryNamed: directoryNameOrPath.
            dir assureExistence.
            dir ]