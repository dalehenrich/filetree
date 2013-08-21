as yet unclassified
testWriteNRead
  "satisfied if load/save/load is performed without errors"

  | packageName versionInfo version stonRepo |
  packageName := 'CCC'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue90');
    package: packageName;
    load.
  {packageName}
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'issue90')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'empty_issue90') storeVersion: version ].
  stonRepo := self getTestRepository: 'empty_issue90'.
  self assert: stonRepo propertyFileExtension = '.ston'.
  self validateStonPropertyFilesFor: stonRepo.
  Gofer new
    package: packageName;
    unload.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'empty_issue90');
    package: packageName;
    load.
  {packageName} do: [ :pn | self assert: (self hasPackage: pn) ]