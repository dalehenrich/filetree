visiting
writeVersionInfo: aVersionInfo
  self repository hasGitFileTreeMetadata
    ifTrue: [ super writeVersionInfo: aVersionInfo ]