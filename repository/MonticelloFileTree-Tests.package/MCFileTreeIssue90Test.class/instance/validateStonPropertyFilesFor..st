as yet unclassified
validateStonPropertyFilesFor: repo
  | dir pkgDir |
  dir := repo directory.
  pkgDir := utilityClass directoryFromPath: 'CCC.package' relativeTo: dir.
  self
    assert: (utilityClass filePathExists: 'properties.ston' relativeTo: pkgDir).
  #('Object.extension' 'CCC.class')
    do: [ :dirName | 
      | clsDir |
      clsDir := utilityClass directoryFromPath: dirName relativeTo: pkgDir.
      self
        assert:
            (utilityClass filePathExists: 'properties.ston' relativeTo: clsDir);
        assert:
            (utilityClass filePathExists: 'methodProperties.ston' relativeTo: clsDir) ]