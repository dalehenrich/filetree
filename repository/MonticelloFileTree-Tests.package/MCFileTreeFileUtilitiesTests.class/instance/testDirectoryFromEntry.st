tests
testDirectoryFromEntry
    | directory relativePathString plink |
    relativePathString := 'plink'.
    self
        setUp: [ 
            directory := utilityClass directoryFromPath: relativePathString relativeTo: defaultDirectory.
            utilityClass ensureDirectoryExists: directory.
            plink := defaultDirectory entries detect: [ :entry | entry name = 'plink' ] ]
        unitUnderTest: [ directory := utilityClass directoryFromEntry: plink ]
        validation: [ self assert: (utilityClass directoryExists: directory) ]
        tearDown: [  ]