tests
testDirectoryPathString_
    | file parent delimiter root directory pathString |
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
                unitUnderTest: [ pathString := utilityClass directoryPathString: directory ]
                validation: [ self assert: (pathString endsWith: 'plank' , utilityClass pathNameDelimiter asString , 'plough') ]
                tearDown: [  ] ]