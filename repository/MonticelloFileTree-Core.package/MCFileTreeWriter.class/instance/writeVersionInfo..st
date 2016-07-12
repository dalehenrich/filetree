visiting
writeVersionInfo: aVersionInfo
  self repository withMonticelloMetadata
    ifTrue: [ super writeVersionInfo: aVersionInfo ]