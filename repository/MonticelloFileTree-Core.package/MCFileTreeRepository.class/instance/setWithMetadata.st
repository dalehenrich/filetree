accessing
setWithMetadata
  self hasGitFileTreeMetadata
    ifFalse: [ 
      self repositoryProperties removeKey: 'Metadata'.
      self writeRepositoryProperties ]