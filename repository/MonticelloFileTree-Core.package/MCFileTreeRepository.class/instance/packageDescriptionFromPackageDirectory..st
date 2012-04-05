actions
packageDescriptionFromPackageDirectory: packageDirectory
    | filename info extension |
    filename := packageDirectory localName.
    extension := filename copyFrom: (filename lastIndexOf: $. ifAbsent: [ '' ]) to: filename size.
    info := self versionInfoForPackageDirectory: packageDirectory.
    ^ self parseName: info name extension: extension