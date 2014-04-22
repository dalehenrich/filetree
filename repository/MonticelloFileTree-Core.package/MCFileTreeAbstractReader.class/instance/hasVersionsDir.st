testing
hasVersionsDir
    ^ self hasMonticelloMetadata and: [
        | mcDir |
        mcDir := self fileUtils directoryFromPath: self monticelloMetaDirName relativeTo: packageDirectory.
        (self fileUtils directoryExists:
            (self fileUtils directoryFromPath: MCFileTreeVersionInfoWriter versionDirName relativeTo: mcDir))]
  