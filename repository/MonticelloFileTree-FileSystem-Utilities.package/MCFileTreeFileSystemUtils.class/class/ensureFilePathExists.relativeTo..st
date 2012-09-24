utilities
ensureFilePathExists: fileNameOrPath relativeTo: aDirectory
    (aDirectory resolveString: fileNameOrPath) parent ensureDirectory