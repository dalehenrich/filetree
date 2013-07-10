as yet unclassified
validateStonPropertyFilesFor: repo
  | dir pkgDir |
  dir := repo directory.
  pkgDir := self utilityClass directoryFromPath: 'CCC.package' relativeTo: dir.
  self
    assert:
      (self utilityClass filePathExists: 'properties.ston' relativeTo: pkgDir).
  #('Object.extension' 'CCC.class')
    do: [ :dirName | 
      | clsDir |
      clsDir := self utilityClass directoryFromPath: dirName relativeTo: pkgDir.
      self
        assert:
            (self utilityClass filePathExists: 'properties.ston' relativeTo: clsDir);
        assert:
            (self utilityClass filePathExists: 'methodProperties.ston' relativeTo: clsDir) ]