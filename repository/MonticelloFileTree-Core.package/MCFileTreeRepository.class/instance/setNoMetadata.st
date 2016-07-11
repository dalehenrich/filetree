accessing
setNoMetadata
  self hasGitFileTreeMetadata
    ifTrue: [ 
      self repositoryProperties at: 'Metadata' put: 'false'.
      self writeRepositoryProperties ]