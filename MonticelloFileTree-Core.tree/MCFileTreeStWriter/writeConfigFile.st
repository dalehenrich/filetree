
!MCFileTreeStWriter methodsFor: 'initialize-release'!
writeConfigFile
    self
        writeInDirectoryName: '.'
        fileName: ''
        extension: '.filetree'
        visit: [ stWriter writeSignature ]! !
