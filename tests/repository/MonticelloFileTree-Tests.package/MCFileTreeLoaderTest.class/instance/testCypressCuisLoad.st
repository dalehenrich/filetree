testing
testCypressCuisLoad
    [ 
    | packageName |
    packageName := 'Cypress-Mocks'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'cuisCypress');
        package: packageName;
        load.
    self validateAgainst: self snapshotCypressCuisDefinitions for: packageName ]
        on: Error
        do: [ :ex | 
            Transcript
                cr;
                show: ex description.
            (self stackOfSize: 100)
                do: [ :item | 
                    Transcript
                        cr;
                        show: item printString asString.
                    item tempScopedNames
                        doWithIndex: [ :title :index | 
                            Transcript
                                cr;
                                tab;
                                nextPutAll: title;
                                nextPut: $:;
                                space;
                                tab;
                                nextPutAll: (item tempAt: index) printString ] ] ]