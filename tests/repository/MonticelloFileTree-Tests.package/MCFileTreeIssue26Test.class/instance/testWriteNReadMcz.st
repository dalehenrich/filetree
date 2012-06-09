tests
testWriteNReadMcz
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
        repository: (self getMczTestRepository: 'mcz');
        package: packageName;
        commit: 'testing'.
    Gofer new
        package: 'AAA';
        package: 'BBB';
        unload.
    #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
    self
        shouldnt: [ 
            Gofer new
                disablePackageCache;
                repository: (self getMczTestRepository: 'mcz');
                package: packageName;
                load ]
        raise: Error.
    #('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]