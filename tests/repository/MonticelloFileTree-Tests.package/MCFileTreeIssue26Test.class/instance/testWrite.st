as yet unclassified
testWrite
    | packageName |
    #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
    packageName := 'AAA'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'dependency01');
        package: packageName;
        load.
    #('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ].
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'empty');
        package: packageName;
        commit: 'testing'