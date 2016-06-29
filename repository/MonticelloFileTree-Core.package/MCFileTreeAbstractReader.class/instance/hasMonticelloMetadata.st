testing
hasMonticelloMetadata
  | metaDir |
  ^ ((self fileUtils
    directoryExists:
      (metaDir := self fileUtils
        directoryFromPath: MCFileTreeStCypressWriter monticelloMetaDirName
        relativeTo: packageDirectory))
    and: [ self fileUtils filePathExists: 'version' relativeTo: metaDir ])
    or: [ 
      (self fileUtils filePathExists: 'version' relativeTo: packageDirectory)
        and: [ self fileUtils filePathExists: 'package' relativeTo: packageDirectory ] ]