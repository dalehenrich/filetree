private
withMonticelloMetadata
  "Monticello metadata:
   - monticello.meta/version file
   - method properties files
  "

  ^ (self repositoryProperties at: 'Metadata' ifAbsent: [ ^ true ]) = 'true'