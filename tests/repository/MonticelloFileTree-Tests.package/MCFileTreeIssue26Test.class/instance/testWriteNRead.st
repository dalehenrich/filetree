as yet unclassified
testWriteNRead
    | packageName |
    #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
    packageName := 'AAA'.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'dependency01');
        package: packageName;
        load.
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'empty');
        package: packageName;
        commit: 'testing'.
    Gofer new
        package: 'AAA';
        package: 'BBB';
        unload.
    #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
    Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'empty');
        package: packageName;
        load.
    #('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]