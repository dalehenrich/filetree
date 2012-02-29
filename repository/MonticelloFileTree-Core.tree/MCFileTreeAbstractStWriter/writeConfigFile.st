
!MCFileTreeAbstractStWriter methodsFor: 'initialize-release'!
writeConfigFile
    self
        writeInDirectoryName: '.'
        fileName: ''
        extension: '.filetree'
        visit: [ stWriter writeProperties ]! !
