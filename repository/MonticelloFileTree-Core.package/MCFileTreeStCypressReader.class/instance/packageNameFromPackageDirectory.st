accessing
packageNameFromPackageDirectory
    | filename |
    filename := self packageDirectory basename.
    ^ filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1