tests
testLoad: aRepository
  "satisfied if load is performed without errors"

  | packageName |
  packageName := 'Issue102'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  semaphore critical: [ "because of the semi-global"
    self class resetTestglobal.
    Gofer new
      disablePackageCache;
      repository: aRepository;
      package: packageName;
      load.
    self assert: { 1 .2 } equals: self class testglobal asArray.
    {packageName} do: [ :pn | self assert: (self hasPackage: pn) ].
    Gofer new
      package: packageName;
      unload.
    true ifFalse: ["removal scripts unsupported on Pahro2.0"
	self assert: { 1 .2 . 3 .4 } equals:  self class testglobal asArray. ]
  ].
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].

