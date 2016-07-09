tests
testLoad01
  | packageName |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless01');
    package: packageName;
    load.
  #('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]