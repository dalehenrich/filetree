testing
testWriteNReadWithVerisonDir
  | packageName versionInfo version |
  packageName := 'Cypress-Mocks'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'ver06');
    package: packageName;
    load.
  self validateAgainst: self targetDefinitions for: packageName.
  {packageName}
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'ver06')
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
  self validateAgainst: self targetDefinitions for: packageName.
