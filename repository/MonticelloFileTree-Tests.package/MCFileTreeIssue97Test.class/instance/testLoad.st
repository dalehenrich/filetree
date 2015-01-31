tests
testLoad
  | packageName |
  packageName := 'Issue97'.
  {packageName}
    do: [ :pn | 
      Transcript
        cr;
        show: 'Issue97 testLoad: [0]: ' , pn.
      self deny: (self hasPackage: pn) ].
  Transcript
    cr;
    show:
        'Issue97 testLoad: [1]: '
            , (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) printString.
  self assert: (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) == nil.
  Transcript
    cr;
    show:
        'Issue97 testLoad: [2]: '
            , (Object selectors includes: #'isCypressMockIssue97') printString.
  self deny: (Object selectors includes: #'isCypressMockIssue97').
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue97');
    package: packageName;
    load.
  Transcript
    cr;
    show:
        'Issue97 testLoad: [3]: '
            , (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) printString.
  self deny: (Smalltalk at: #'CypressMockIssue97' ifAbsent: [  ]) == nil.
  Transcript
    cr;
    show:
        'Issue97 testLoad: [4]: '
            , (Object selectors includes: #'isCypressMockIssue97') printString.
  self assert: (Object selectors includes: #'isCypressMockIssue97').
  Transcript
    cr;
    show: 'Issue97 testLoad: [5]'