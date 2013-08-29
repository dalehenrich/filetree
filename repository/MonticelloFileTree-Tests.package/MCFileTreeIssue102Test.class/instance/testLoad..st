tests
testLoad: aRepository
  "satisfied if load is performed without errors"

  | packageName |
  packageName := 'Issue102'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  semaphore critical: [ "because of the global"
    Smalltalk at: #xxMCScriptTestGlobalxx put: (OrderedCollection new).
    Gofer new
      disablePackageCache;
      repository: aRepository;
      package: packageName;
      load.
    self assert: { 1 .2 } equals: (Smalltalk at: #xxMCScriptTestGlobalxx) asArray.
    {packageName} do: [ :pn | self assert: (self hasPackage: pn) ].
    Gofer new
      package: packageName;
      unload.
    self assert: { 1 .2 . 3 .4 } equals: (Smalltalk at: #xxMCScriptTestGlobalxx) asArray.
  ].
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].

