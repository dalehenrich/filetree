tests
testLoad
  ""

  | packageName |
  packageName := 'Issue97'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  self assert: (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) == nil.
  self deny: (Object selectors includes: #'isCypressMockIssue97').
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue97');
    package: packageName;
    load.
  self deny: (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) == nil.
  self assert: (Object selectors includes: #'isCypressMockIssue97')