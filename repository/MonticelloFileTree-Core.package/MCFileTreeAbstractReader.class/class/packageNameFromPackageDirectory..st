accessing
packageNameFromPackageDirectory: aPackageDirectory
  | filename |
  filename := self fileUtils directoryName: aPackageDirectory.
  ^ filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1