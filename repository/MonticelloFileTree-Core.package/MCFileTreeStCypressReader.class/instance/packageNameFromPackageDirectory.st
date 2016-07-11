accessing
packageNameFromPackageDirectory
  | filename |
  filename := MCFileTreeFileUtils current directoryName: packageDirectory.
  ^ filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1	"strip package extension"