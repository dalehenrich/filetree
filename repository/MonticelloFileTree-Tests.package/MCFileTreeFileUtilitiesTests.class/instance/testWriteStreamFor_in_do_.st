tests
testWriteStreamFor_in_do_
    | relativePathString directory parent file |
    self
        setUp: [ 
            relativePathString := 'plank' , utilityClass pathNameDelimiter asString , 'file'.
            utilityClass ensureFilePathExists: relativePathString relativeTo: defaultDirectory ]
        unitUnderTest: [ utilityClass writeStreamFor: relativePathString in: defaultDirectory do: [ :stream | stream nextPutAll: 'the goods' ] ]
        validation: [ self assert: (utilityClass filePathExists: relativePathString relativeTo: defaultDirectory) ]
        tearDown: [ 
            file := utilityClass resolvePath: relativePathString in: defaultDirectory.
            parent := utilityClass parentDirectoryOf: file.
            self deleteAll: parent ]