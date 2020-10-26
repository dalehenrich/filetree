tests
testLoad
  | packageName |
  #('Issue231') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'Issue231'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue231');
    package: packageName;
    load.
  self validateSelectors