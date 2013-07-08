as yet unclassified
testCreateStonRepository
  "create repository and set propertyFileExtension to .ston"

  | workingDir tempDir |
  workingDir := utilityClass default.
  tempDir := utilityClass directoryFromPath: 'temp' relativeTo: workingDir.
  [ 
  | repoDir repo newRepo |
  utilityClass ensureDirectoryExists: tempDir.
  repoDir := utilityClass directoryFromPath: 'repo' relativeTo: tempDir.
  utilityClass ensureDirectoryExists: repoDir.
  repo := MCFileTreeRepository new directory: repoDir.
  self assert: repo propertyFileExtension = '.json'.
  repo propertyFileExtension: '.ston'.
  self assert: repo propertyFileExtension = '.ston'.
  newRepo := MCFileTreeRepository new directory: repoDir.
  self assert: repo propertyFileExtension = '.ston' ]
    ensure: [ utilityClass deleteAll: tempDir ]