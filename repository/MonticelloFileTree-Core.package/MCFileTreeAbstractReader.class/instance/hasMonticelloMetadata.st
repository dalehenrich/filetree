testing
hasMonticelloMetadata
    ^ (packageDirectory directoryNamed: MCFileTreeStCypressWriter monticelloMetaDirName) exists
        or: [ (packageDirectory fileExists: 'version') and: [ packageDirectory fileExists: 'package' ] ]