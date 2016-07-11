tests
testWrite02
  "no  version/dependency/package properties"

  | packageName version versionInfo repo |
  #('AAA' 'BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  packageName := 'AAA'.
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'metadataless02');
    package: packageName;
    load.
  #('BBB') do: [ :pn | self deny: (self hasPackage: pn) ].
  repo := self getTestRepository: 'emptyMetadataless'.
  repo setWithMetadata.
  #('AAA')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless02')
        versionWithInfo: versionInfo.
      repo storeVersion: version.
      self assert: repo hasGitFileTreeMetadata ].
  repo setNoMetadata.
  #('AAA')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless02')
        versionWithInfo: versionInfo.
      repo storeVersion: version.
      self deny: repo hasGitFileTreeMetadata ].
  repo setWithMetadata.
  #('AAA')
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'metadataless02')
        versionWithInfo: versionInfo.
      repo storeVersion: version.
      self assert: repo hasGitFileTreeMetadata ]