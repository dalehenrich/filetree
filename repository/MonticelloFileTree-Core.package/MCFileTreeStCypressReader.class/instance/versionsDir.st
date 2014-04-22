accessing
versionsDir
    | monticelloMetaDir |
    monticelloMetaDir := self fileUtils directoryFromPath: self monticelloMetaDirName relativeTo: packageDirectory.
    ^ self fileUtils directoryFromPath: MCFileTreeVersionInfoWriter versionDirName relativeTo: monticelloMetaDir.
