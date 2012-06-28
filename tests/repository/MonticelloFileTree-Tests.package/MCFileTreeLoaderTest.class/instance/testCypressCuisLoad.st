testing
testCypressCuisLoad
    | gofer |
    [ 
    | packageName |
    packageName := 'Cypress-Mocks'.
    (gofer := Gofer new)
        disablePackageCache;
        repository: (self getTestRepository: 'cuisCypress');
        package: packageName;
        load.
    self validateAgainst: self snapshotCypressCuisDefinitions for: packageName ]
        on: Error
        do: [ :ex | 
            Transcript
                cr;
                show: '**************REFS'.
            gofer allResolved
                do: [ :ref | 
                    Transcript
                        cr;
                        show: ref name , ' ' , ref package ].
            Transcript
                cr;
                show: '***************************************************';
                cr;
                show: ex description.
            (ex signalerContext stackOfSize: 100)
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
                                nextPutAll: (item tempAt: index) printString ].
                    Transcript
                        cr;
                        show: '***************************************************' ].
            ex pass ]