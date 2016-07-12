accessing
setWithMetadata
  self withMonticelloMetadata
    ifFalse: [ 
      self repositoryProperties removeKey: 'Metadata'.
      self writeRepositoryProperties ]