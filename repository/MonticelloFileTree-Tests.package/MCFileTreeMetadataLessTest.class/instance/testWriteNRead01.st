tests
testWriteNRead01
  | packageName versionInfo version repo |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless01');
    package: packageName;
    load.
  repo := self getTestRepository: 'emptyMetadataless'.
  repo setWithMetadata.
  2
    timesRepeat: [ 
      #('AAA' 'BBB')
        do: [ :pn | 
          versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
            ancestors first.
          version := (self getTestRepository: 'metadataless01')
            versionWithInfo: versionInfo.
          repo storeVersion: version ].
      Gofer new
        package: 'AAA';
        package: 'BBB';
        unload.
      #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
      Gofer new
        disablePackageCache;
        repository: repo;
        package: packageName;
        load.
      #('AAA' 'BBB') do: [ :pn | self assert: (self hasPackage: pn) ].
      repo setNoMetadata ].
  repo setWithMetadata