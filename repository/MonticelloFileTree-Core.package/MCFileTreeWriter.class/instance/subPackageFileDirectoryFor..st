visiting
subPackageFileDirectoryFor: directoryNameOrPath
    ^ cachedPackageFileDirectoryEntries
        at: directoryNameOrPath
        ifAbsentPut: [ 
            | dir |
            dir := self packageFileDirectory resolve: directoryNameOrPath.
            dir ensureDirectory.
            dir ]