tests
testWriteNRead02
  | packageName versionInfo version repo |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless02');
    package: packageName;
    load.
  repo := self getTestRepository: 'emptyMetadataless'.
  repo setWithMetadata.
  2
    timesRepeat: [ 
      #('AAA')
        do: [ :pn | 
          versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
            ancestors first.
          version := (self getTestRepository: 'metadataless02')
            versionWithInfo: versionInfo.
          repo := self getTestRepository: 'emptyMetadataless'.
          repo storeVersion: version ].
      #('BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
      Gofer new
        package: 'AAA';
        unload.
      #('AAA') do: [ :pn | self deny: (self hasPackage: pn) ].
      Gofer new
        disablePackageCache;
        repository: (self getTestRepository: 'emptyMetadataless');
        package: packageName;
        load.
      #('AAA') do: [ :pn | self assert: (self hasPackage: pn) ].
      repo setNoMetadata ].
  repo setWithMetadata