tests
testExtensionMethodError
  | packageName gofer hitError description |
  packageName := 'Issue136-2'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  gofer := Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue136');
    package: packageName;
    yourself.
  hitError := false.
  [ gofer load ]
    on: Error
    do: [ :ex | 
      hitError := (description := ex description)
        endsWith:
          'Method protocol ''*Issue97'' for the maethod ''isCypressMockIssue97'' in class ''Object'' is inconsistent with the package name ''*issue136-2''' ].
  self assert: hitError description: description