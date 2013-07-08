private
propertyFileExtension: propertyFileExtension
  self repositoryProperties
    at: 'propertyFileExtension'
    put: propertyFileExtension.
  self writeRepositoryProperties