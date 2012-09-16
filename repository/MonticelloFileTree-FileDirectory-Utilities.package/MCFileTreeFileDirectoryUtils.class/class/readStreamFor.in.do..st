utilities
readStreamFor: filePath in: aDirectory do: aBlock
    ^ aDirectory readOnlyFileNamed: filePath do: aBlock