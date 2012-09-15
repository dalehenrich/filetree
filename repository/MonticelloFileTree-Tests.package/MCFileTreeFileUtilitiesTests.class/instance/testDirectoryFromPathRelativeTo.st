tests
testDirectoryFromPathRelativeTo
    | file parent delimiter root directory |
    delimiter := utilityClass pathNameDelimiter asString.
    root := 'plink'.
    self deleteAll: (utilityClass resolvePath: root in: defaultDirectory).
    {(root , delimiter , 'plonk' , delimiter , 'plunk' , delimiter , 'plough').
    (root , delimiter , 'plank' , delimiter , 'plough')}
        do: [ :relativePathString | 
            self
                setUp: [  ]
                unitUnderTest: [ 
                    directory := utilityClass directoryFromPath: relativePathString relativeTo: defaultDirectory.
                    utilityClass ensureDirectoryExists: directory ]
                validation: [ 
                    directory := utilityClass resolvePath: relativePathString in: defaultDirectory.
                    self assert: (utilityClass directoryExists: directory) ]
                tearDown: [  ] ]