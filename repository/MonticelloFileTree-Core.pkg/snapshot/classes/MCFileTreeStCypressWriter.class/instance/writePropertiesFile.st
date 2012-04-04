
!MCFileTreeStCypressWriter methodsFor: 'initialize-release'!
writePropertiesFile
    self
        writeInDirectoryName: '.'
        fileName: ''
        extension: '.filetree'
        visit: [ self halt ].
    self
        writeInDirectoryName: '.'
        fileName: 'properties'
        extension: '.json'
        visit: [ self halt ]! !
