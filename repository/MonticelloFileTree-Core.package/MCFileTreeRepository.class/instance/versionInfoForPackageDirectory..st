actions
versionInfoForPackageDirectory: packageDirectory
    ^ ((MCReader readerClassForFileNamed: packageDirectory basename)
        on: packageDirectory)
        loadVersionInfo;
        info