tests
testWriteNRead
  | packageName versionInfo version |
  #('Issue69') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'Issue69'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue69');
    package: packageName;
    load.
  self validateSelectors.
  #('Issue69')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'issue69')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'empty') storeVersion: version ].
  Gofer new
    package: 'Issue69';
    unload.
  #('Issue69') do: [ :pn | self deny: (self hasPackage: pn) ].
  self
    shouldnt: [ 
      Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'empty');
        package: packageName;
        load ]
    raise: Error.
  #('Issue69') do: [ :pn | self assert: (self hasPackage: pn) ].
  self validateSelectors