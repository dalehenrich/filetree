utilities
filePathExists: filePath relativeTo: aDirectory
    ^ aDirectory fileExists: (aDirectory fullNameFor: filePath)