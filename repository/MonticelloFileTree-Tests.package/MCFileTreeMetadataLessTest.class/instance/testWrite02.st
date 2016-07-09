tests
testWrite02
  "no  version/dependency/package properties"

  | packageName version versionInfo |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless02');
    package: packageName;
    load.
  #('BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  #('AAA')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless02')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'emptyMetadataless') storeVersion: version ]