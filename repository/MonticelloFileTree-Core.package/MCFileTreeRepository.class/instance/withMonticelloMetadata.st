private
withMonticelloMetadata
  "Monticello metadata:
   - monticello.meta/version file
   - method properties files
  "

  ^ (self repositoryProperties
    at: 'Metadata'
    ifAbsent: [ ^ (self repositoryProperties at: 'noMethodMetaData' ifAbsent: [ false ]) not ])
    = 'true'