tests
testLoad
    | packageName |
    #('CCC') do: [ :pn | self deny: (self hasPackage: pn) ].
    packageName := 'CCC'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'issue113');
        package: packageName;
        load.
    #('CCC') do: [ :pn | self assert: (self hasPackage: pn) ].
    self validateTimestamp: 'dkh 11/2/1954 16:15'