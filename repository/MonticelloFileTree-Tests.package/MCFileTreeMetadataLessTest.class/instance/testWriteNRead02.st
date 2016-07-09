tests
testWriteNRead02
  | packageName versionInfo version |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless02');
    package: packageName;
    load.
  #('AAA' 'BBB')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless02')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'emptyMetadataless') storeVersion: version ].
  Gofer new
    package: 'AAA';
    package: 'BBB';
    unload.
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  self
    shouldnt: [ 
      Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'emptyMetadataless');
        package: packageName;
        load ]
    raise: Error.
  #('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ]