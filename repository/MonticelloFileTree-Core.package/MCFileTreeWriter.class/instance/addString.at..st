writing
addString: string at: fileNameOrPath
  "fileNameOrPath may have one or two elements"

  | utils fullPath path fileContents |
  utils := MCFileTreeFileUtils current.
  fileContents := string.
  path := MCFileTreePackageStructureStWriter useCypressWriter
    ifTrue: [ 
      fileContents := fileContents encodeAsUTF8 asString.
      fullPath := utils
        buildPathFrom:
          {(MCFileTreeStCypressWriter monticelloMetaDirName).
          fileNameOrPath}.
      utils ensureFilePathExists: fullPath relativeTo: self packageFileDirectory.
      fullPath ]
    ifFalse: [ fileNameOrPath ].
  fileContents isEmpty
    ifFalse: [ 
      utils
        writeStreamFor: path
        in: self packageFileDirectory
        do: [ :file | file nextPutAll: fileContents ] ]