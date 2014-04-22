utilities
loadVersionsDir
    | versionId versionInfos |
    versionInfos := self postProcessVersionsDict: (self loadVersionsInDir: self versionsDir).
    versionId := self loadVersionIdIn: (self fileUtils
        directoryFromPath: self monticelloMetaDirName relativeTo: packageDirectory).
    ^ versionInfos at: versionId