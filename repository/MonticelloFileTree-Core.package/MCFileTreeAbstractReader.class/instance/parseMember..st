utilities
parseMember: fileName
    | directory tokens contents |
    directory := packageDirectory directoryNamed: self monticelloMetaDirName.
    contents := directory fileNamed: fileName do: [ :file | file contents ].
    tokens := (self scanner scanTokens: contents) first.
    ^ self associate: tokens