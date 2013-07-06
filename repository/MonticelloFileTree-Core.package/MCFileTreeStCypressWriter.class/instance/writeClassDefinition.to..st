writing
writeClassDefinition: definition to: classPath
    self
        writeInDirectoryName: classPath
        fileName: 'README'
        extension: '.md'
        visit: [ self writeClassComment: definition ].
    self
        writeInDirectoryName: classPath
        fileName: 'properties'
        extension: '.json'
        visit: [ self writeClassDefinition: definition ].
    self
        writeInDirectoryName: classPath
        fileName: 'methodProperties'
        extension: '.json'
        visit: [ self writeMethodProperties: (self methodDefinitions at: definition className ifAbsent: [ #() ]) ]