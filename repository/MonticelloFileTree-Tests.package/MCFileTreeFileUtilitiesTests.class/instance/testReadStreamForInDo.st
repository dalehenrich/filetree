tests
testReadStreamForInDo
    | relativePathString directory parent file contents x |
    self
        setUp: [ 
            relativePathString := 'plank' , utilityClass pathNameDelimiter asString , 'file'.
            utilityClass ensureFilePathExists: relativePathString relativeTo: defaultDirectory.
            contents := 'the goods'.
            utilityClass
                writeStreamFor: relativePathString
                in: defaultDirectory
                do: [ :stream | stream nextPutAll: contents ] ]
        unitUnderTest: [ 
            utilityClass
                readStreamFor: relativePathString
                in: defaultDirectory
                do: [ :stream | self assert: (x := stream contents asString) = contents ] ]
        validation: [ self assert: (utilityClass filePathExists: relativePathString relativeTo: defaultDirectory) ]
        tearDown: [ 
            file := utilityClass resolvePath: relativePathString in: defaultDirectory.
            parent := utilityClass parentDirectoryOf: file.
            self deleteAll: parent ]