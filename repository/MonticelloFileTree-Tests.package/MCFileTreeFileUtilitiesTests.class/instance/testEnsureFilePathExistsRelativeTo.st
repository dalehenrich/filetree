tests
testEnsureFilePathExistsRelativeTo
    | file parent delimiter root |
    delimiter := utilityClass pathNameDelimiter asString.
    root := 'plink'.
    self deleteAll: (utilityClass resolvePath: root in: defaultDirectory).
    {(root , delimiter , 'plonk' , delimiter , 'plunk' , delimiter , 'file').
    (root , delimiter , 'plank' , delimiter , 'file')}
        do: [ :relativePathString | 
            self
                setUp: [  ]
                unitUnderTest: [ utilityClass ensureFilePathExists: relativePathString relativeTo: defaultDirectory ]
                validation: [ 
                    file := utilityClass resolvePath: relativePathString in: defaultDirectory.
                    parent := utilityClass parentDirectoryOf: file.
                    self assert: (utilityClass directoryExists: parent) ]
                tearDown: [  ] ]