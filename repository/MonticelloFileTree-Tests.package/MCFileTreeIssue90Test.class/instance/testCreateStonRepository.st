as yet unclassified
testCreateStonRepository
  "create repository and set propertyFileExtension to .ston"

  | workingDir tempDir |
  workingDir := self utilityClass default.
  tempDir := self utilityClass directoryFromPath: 'temp' relativeTo: workingDir.
  [ 
  | repoDir repo newRepo |
  self utilityClass ensureDirectoryExists: tempDir.
  repoDir := self utilityClass directoryFromPath: 'repo' relativeTo: tempDir.
  self utilityClass ensureDirectoryExists: repoDir.
  repo := MCFileTreeRepository new directory: repoDir.
  self assert: repo propertyFileExtension = '.json'.
  repo propertyFileExtension: '.ston'.
  self assert: repo propertyFileExtension = '.ston'.
  newRepo := MCFileTreeRepository new directory: repoDir.
  self assert: repo propertyFileExtension = '.ston' ]
    ensure: [ self utilityClass deleteAll: tempDir ]