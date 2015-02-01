tests
testClassV3
  | packageName |
  packageName := 'Issue136-1.v3'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue136');
    version: 'Issue136-1.v3-cypress.1';
    load.
  self deny: (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) == nil