
!MCFileTreeAbstractStWriter methodsFor: 'initialize-release'!
writePropertiesFile
    self
        writeInDirectoryName: '.'
        fileName: ''
        extension: '.filetree'
        visit: [ stWriter writeProperties ]! !
