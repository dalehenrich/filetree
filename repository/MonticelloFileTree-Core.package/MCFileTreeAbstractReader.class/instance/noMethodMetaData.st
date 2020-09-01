testing
noMethodMetaData
  ^ self packageProperties
    at: 'noMethodMetaData'
    ifAbsent: [ self withMonticelloMetadata not ]