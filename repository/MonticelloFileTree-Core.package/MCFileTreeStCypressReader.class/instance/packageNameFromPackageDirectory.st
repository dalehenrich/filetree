accessing
packageNameFromPackageDirectory
    | filename |
    filename := packageDirectory localName.
    ^ filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1