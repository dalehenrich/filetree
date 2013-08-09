tests
testLoad
  | packageName |
  packageName := 'Issue92'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue69');
    package: packageName;
    load.
  self validateSelectors