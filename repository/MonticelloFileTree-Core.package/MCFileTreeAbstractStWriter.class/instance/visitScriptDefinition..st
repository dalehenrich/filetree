visiting
visitScriptDefinition: definition
    self
        writeInDirectoryName: self monticelloMetaDirName
        fileName: definition scriptSelector asString
        extension: '.st'
        visit: [ stWriter writeScriptDefinition: definition ]