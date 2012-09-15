utilities
parseMember: fileName
    | directory tokens contents |
    directory := packageDirectory directoryNamed: self monticelloMetaDirName.
    contents := directory readOnlyFileNamed: fileName do: [ :file | file contents ].
    tokens := (self scanner scanTokens: contents) first.
    ^ self associate: tokens
