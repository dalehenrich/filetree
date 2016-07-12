accessing
setNoMetadata
  self withMonticelloMetadata
    ifTrue: [ 
      self repositoryProperties at: 'Metadata' put: 'false'.
      self writeRepositoryProperties ]