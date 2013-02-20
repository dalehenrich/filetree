tests
testLoad
  | packageName |
  #('Issue69') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'Issue69'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue69');
    package: packageName;
    load.
  self validateSelectors