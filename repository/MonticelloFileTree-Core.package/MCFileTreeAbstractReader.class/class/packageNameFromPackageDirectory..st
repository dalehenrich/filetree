accessing
packageNameFromPackageDirectory: aPackageDirectory
  | filename basename |
  filename := MCFileTreeFileUtils current directoryName: aPackageDirectory.
  basename := filename copyFrom: 1 to: (filename lastIndexOf: $.) - 1.	"strip package extension"
  (basename indexOf: $.) = 0
    ifTrue: [ ^ basename ].
  ^ basename copyFrom: 1 to: (basename lastIndexOf: $.) - 1	"strip monticello branch name"