tests
testWriteNRead
  | packageName versionInfo version |
  packageName := 'Issue92'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue69');
    package: packageName;
    load.
  self validateSelectors.
  {packageName}
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'issue69')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'empty') storeVersion: version ].
  Gofer new
    package: packageName;
    unload.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  self
    shouldnt: [ 
      Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'empty');
        package: packageName;
        load ]
    raise: Error.
  {packageName} do: [ :pn | self assert: (self hasPackage: pn) ].
  self validateSelectors