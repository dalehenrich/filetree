as yet unclassified
goferVersionFrom: aVersionReference
  "until we no longer find .tree directories in the wild"

  | packageDirectories |
  packageDirectories := (self readableFileNames
    collect: [ :fileName | self fileDirectoryOn: fileName ])
    select: [ :packageDirectory | self fileUtils directoryExists: packageDirectory ].
  packageDirectories
    do: [ :packageDirectory | 
      "assume that package name can be derived from directory name "
      ((MCFileTreeAbstractReader
        packageNameFromPackageDirectory: packageDirectory)
        = aVersionReference name
        and: [ 
          "confirm by loading version info"
          (self versionInfoForPackageDirectory: packageDirectory) name
            = aVersionReference name ])
        ifTrue: [ 
          ^ self
            loadVersionFromFileNamed:
              (self fileUtils directoryName: packageDirectory) ] ].
  packageDirectories
    do: [ :packageDirectory | 
      "brute force scan all directories for a matching version info"
      (self versionInfoForPackageDirectory: packageDirectory) name
        = aVersionReference name
        ifTrue: [ 
          ^ self
            loadVersionFromFileNamed:
              (self fileUtils directoryName: packageDirectory) ] ].
  ^ nil