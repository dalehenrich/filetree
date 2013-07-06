writing
writeExtensionClassDefinition: definition to: classPath
    self
        writeInDirectoryName: classPath
        fileName: 'properties'
        extension: '.ston'
        visit: [ self writeExtensionClassDefinition: definition ]