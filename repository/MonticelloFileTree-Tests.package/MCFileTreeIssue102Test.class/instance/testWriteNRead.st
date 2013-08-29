tests
testWriteNRead
  "satisfied if load/save/load is performed without errors"

  | packageName versionInfo version otherRepo metaDir |
  packageName := 'Issue102'.
  {packageName} do: [ :pn | self deny: (self hasPackage: pn) ].
  Gofer new
    disablePackageCache;
    repository: (self getTestRepository: 'issue102');
    package: packageName;
    load.
  {packageName}
    do: [ :pn | 
      versionInfo := (MCWorkingCopy allManagers detect: [ :wc | wc packageName = pn ])
        ancestors first.
      version := (self getTestRepository: 'issue102')
        versionWithInfo: versionInfo.
      (self getTestRepository: 'empty_issue102') storeVersion: version ].
  otherRepo := self getTestRepository: 'empty_issue102'.

  metaDir := self utilityClass
    directoryFromPath: MCFileTreeStCypressWriter monticelloMetaDirName
    relativeTo:  (otherRepo directory entries select: [:e | 
      e isDirectory and: [ e name endsWith: otherRepo packageExtension]]) first asFileReference.
  self assert: (self utilityClass directoryExists: metaDir).
  #('postscript.st' 'postscriptOfRemoval.st' 'preamble.st' 'preambleOfRemoval.st') do: [:scriptFile |
    self assert: (self utilityClass filePathExists: scriptFile relativeTo: metaDir)].

  Gofer new
    package: packageName;
    unload.
  "shortcut here."
  self testLoad: (self getTestRepository: 'empty_issue102').
