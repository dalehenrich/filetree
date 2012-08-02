testing
hasMonticelloMetadata
    ^ (self packageDirectory / MCFileTreeStCypressWriter monticelloMetaDirName) exists
        or: [(self packageDirectory / 'version') exists and: [(self packageDirectory / 'package') exists ]]