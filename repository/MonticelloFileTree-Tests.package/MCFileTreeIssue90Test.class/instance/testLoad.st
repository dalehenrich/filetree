as yet unclassified
testLoad
  "satisfied if load is performed without errors"

  | packageName |
  packageName := 'CCC'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue90');
    package: packageName;
    load.
  {packageName} do: [ :pn | self assert: (self hasPackage: pn) ]