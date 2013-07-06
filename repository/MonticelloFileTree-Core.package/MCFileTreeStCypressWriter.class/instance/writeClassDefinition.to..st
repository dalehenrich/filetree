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
        extension: '.ston'
        visit: [ self writeClassDefinition: definition ].
    self
        writeInDirectoryName: classPath
        fileName: 'methodProperties'
        extension: '.ston'
        visit: [ self writeMethodProperties: (self methodDefinitions at: definition className ifAbsent: [ #() ]) ]