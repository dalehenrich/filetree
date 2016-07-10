accessing
packageNameFromPackageDirectory: aPackageDirectory
  | filename |
  filename := MCFileTreeFileUtils current directoryName: aPackageDirectory.
  ^ filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1