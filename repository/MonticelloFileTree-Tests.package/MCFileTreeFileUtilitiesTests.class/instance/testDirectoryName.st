tests
testDirectoryName
    | file parent delimiter root directory directoryName |
    delimiter := utilityClass pathNameDelimiter asString.
    root := 'plink'.
    self deleteAll: (utilityClass resolvePath: root in: defaultDirectory).
    {(root , delimiter , 'plonk' , delimiter , 'plank' , delimiter , 'plough').
    (root , delimiter , 'plank' , delimiter , 'plough')}
        do: [ :relativePathString | 
            self
                setUp: [ 
                    directory := utilityClass directoryFromPath: relativePathString relativeTo: defaultDirectory.
                    utilityClass ensureDirectoryExists: directory ]
                unitUnderTest: [ directoryName := utilityClass directoryName: directory ]
                validation: [ self assert: directoryName = 'plough' ]
                tearDown: [  ] ]