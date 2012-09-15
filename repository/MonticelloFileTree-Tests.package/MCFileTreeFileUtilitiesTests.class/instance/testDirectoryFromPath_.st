tests
testDirectoryFromPath_
    | file parent delimiter root directory pathString directoryFromPath |
    delimiter := utilityClass pathNameDelimiter asString.
    root := 'plink'.
    self deleteAll: (utilityClass resolvePath: root in: defaultDirectory).
    {(root , delimiter , 'plonk' , delimiter , 'plank' , delimiter , 'plough').
    (root , delimiter , 'plank' , delimiter , 'plough')}
        do: [ :relativePathString | 
            self
                setUp: [ 
                    directory := utilityClass directoryFromPath: relativePathString relativeTo: defaultDirectory.
                    pathString := utilityClass directoryPathString: directory ]
                unitUnderTest: [ 
                    directoryFromPath := utilityClass directoryFromPath: pathString.
                    utilityClass ensureDirectoryExists: directoryFromPath ]
                validation: [ 
                    self assert: (utilityClass directoryExists: directory).
                    self assert: (utilityClass directoryExists: directoryFromPath) ]
                tearDown: [  ] ]