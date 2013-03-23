utilities
parseMember: fileName
  | directory tokens contents |
  directory := packageDirectory directoryNamed: self monticelloMetaDirName.
  contents := directory
    readOnlyFileNamed: fileName
    do: [ :file | file contents decodeFromUTF8 ].
  tokens := (self scanner scanTokens: contents) first.
  ^ self associate: tokens