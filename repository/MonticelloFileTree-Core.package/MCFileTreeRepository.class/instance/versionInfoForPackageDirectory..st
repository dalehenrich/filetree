actions
versionInfoForPackageDirectory: packageDirectory
  | reader |
  reader := (MCReader
    readerClassForFileNamed: (self fileUtils directoryName: packageDirectory))
    on: (self fileUtils parentDirectoryOf: packageDirectory)
    fileName: (self fileUtils directoryName: packageDirectory).
  reader hasGitFileTreeMetadata: self hasGitFileTreeMetadata.
  ^ reader
    loadVersionInfo;
    info