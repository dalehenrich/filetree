utilities
ensureFilePathExists: fileNameOrPath relativeTo: aDirectory
    FileDirectory splitName: fileNameOrPath to: [ :fPath :fname | (aDirectory directoryNamed: fPath) assureExistence ]