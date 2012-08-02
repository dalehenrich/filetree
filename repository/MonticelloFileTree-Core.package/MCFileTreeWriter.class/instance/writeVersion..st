visiting
writeVersion: aVersion
    | members |
    directory := (members := MCFileTreeRepository parseName: aVersion info name) last.
    self deleteExistingPackageStructureFor: members.
    self packageFileDirectory ensureDirectory.
    self initializePackageFileDirectoryCache.
    super writeVersion: aVersion