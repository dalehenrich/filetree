utilities
parseMember: fileName
    | directory tokens contents |
    directory := self packageDirectory / self monticelloMetaDirName.
    contents := (directory / fileName) readStreamDo: [ :aStream | aStream contents ].
    tokens := (self scanner scanTokens: contents) first.
    ^ self associate: tokens