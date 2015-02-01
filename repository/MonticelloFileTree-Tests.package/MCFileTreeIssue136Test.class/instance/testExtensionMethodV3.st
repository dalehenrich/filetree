tests
testExtensionMethodV3
  | packageName |
  packageName := 'Issue136-2.v3'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue136');
    version: 'Issue136-2.v3-cypress.1';
    load.
  self assert: (Object selectors includes: #'isCypressMockIssue97')