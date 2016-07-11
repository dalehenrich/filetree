tests
testWrite01
  | packageName version versionInfo repo |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless01');
    package: packageName;
    load.
  repo := self getTestRepository: 'emptyMetadataless'.
  repo setWithMetadata.
  #('AAA' 'BBB')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless01')
        versionWithInfo: versionInfo.
      repo storeVersion: version.
      self assert: repo hasGitFileTreeMetadata ].
  repo setNoMetadata.
  #('AAA' 'BBB')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless01')
        versionWithInfo: versionInfo.
      repo storeVersion: version.
      self deny: repo hasGitFileTreeMetadata ].
  repo setWithMetadata.
  #('AAA' 'BBB')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless01')
        versionWithInfo: versionInfo.
      repo storeVersion: version.
      self assert: repo hasGitFileTreeMetadata ]