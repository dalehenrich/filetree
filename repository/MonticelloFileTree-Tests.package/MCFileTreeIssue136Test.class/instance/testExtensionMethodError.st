tests
testExtensionMethodError
| packageName gofer hitError description |
  packageName := 'Issue136-3'.
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
      description := ex description.
      description = 'Bad BitBlt arg (Fraction?); proceed to convert.'
        ifTrue: [ ex resume ].
     hitError := description
        endsWith:
          'Method protocol ''*Issue97'' for the method ''isCypressMockIssue97'' in class ''Object'' is inconsistent with the package name ''*issue136-3''' ].
  Transcript
    cr;
    show:
        'testExtensionMethodError: ' , hitError printString , ' :: '
            , description printString.
  self assert: hitError description: description