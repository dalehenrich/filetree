tests
testClassError
  | packageName gofer hitError description |
  packageName := 'Issue136-1'.
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
          'Class category name ''Issue97'' for the class ''CypressMockIssue97'' is inconsistent with the package name ''Issue136-1''' ].
  Transcript
    cr;
    show:
        'testClassError: ' , hitError printString , ' :: ' , description printString.
  self assert: hitError description: description