actions
versionInfoForPackageDirectory: packageDirectory
    ^ ((MCReader readerClassForFileNamed: packageDirectory localName)
        on: packageDirectory containingDirectory
        fileName: packageDirectory localName)
        loadVersionInfo;
        info