writing
writeExtensionClassDefinition: definition to: classPath
    self
        writeInDirectoryName: classPath
        fileName: 'properties'
        extension: '.json'
        visit: [ self writeExtensionClassDefinition: definition ]