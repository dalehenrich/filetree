tests
testWrite01
  | packageName version versionInfo |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless01');
    package: packageName;
    load.
  #('AAA' 'BBB')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless01')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'emptyMetadataless') storeVersion: version ]