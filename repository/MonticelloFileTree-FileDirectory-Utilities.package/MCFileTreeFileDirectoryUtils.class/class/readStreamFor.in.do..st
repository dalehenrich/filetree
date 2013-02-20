utilities
readStreamFor: filePath in: aDirectory do: aBlock
    ^ aDirectory fileNamed: filePath do: aBlock