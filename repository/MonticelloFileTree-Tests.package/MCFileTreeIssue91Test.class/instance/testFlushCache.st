as yet unclassified
testFlushCache
  "create repository and set propertyFileExtension to .ston"

  | workingDir tempDir repositoryProperties |
  workingDir := self utilityClass default.
  tempDir := self utilityClass directoryFromPath: 'temp' relativeTo: workingDir.
  [ 
  | repoDir repo newRepo expected |
  self utilityClass ensureDirectoryExists: tempDir.
  repoDir := self utilityClass directoryFromPath: 'repo' relativeTo: tempDir.
  self utilityClass ensureDirectoryExists: repoDir.	"
---
verify that we're getting default propertyExtension
"
  expected := MCFileTreeRepository defaultPropertyFileExtension.
  self assert: expected = '.json'.
  repo := MCFileTreeRepository new directory: repoDir.
  self assert: repo propertyFileExtension = expected.	"
---
verify that flushCache runs without error
"
  repo flushCache.
  self assert: repo propertyFileExtension = expected.	"
---
write new .filetree, with new propertyFileExtension
"
  repositoryProperties := repo repositoryProperties copy.
  repositoryProperties at: 'propertyFileExtension' put: '.ston'.
  self writeRepositoryProperties: repositoryProperties in: repoDir.	"
---
new extension shouldn't take effect until there is a flushCache
"
  self assert: repo propertyFileExtension = expected.
  expected := '.ston'.
  repo flushCache.
  self assert: repo propertyFileExtension = expected.	"
---
restore default propertyExtension
"
  repositoryProperties at: 'propertyFileExtension' put: '.json'.
  self writeRepositoryProperties: repositoryProperties in: repoDir.
  self assert: repo propertyFileExtension = expected.	"
---
explicitly setting directory should force reread of property file
"
  expected := '.json'.
  repo directory: repoDir.
  self assert: repo propertyFileExtension = expected.	"
---
flushCache with non-existent directory should have no effect
"
  self utilityClass deleteAll: tempDir.
  repo flushCache.
  self assert: repo propertyFileExtension = expected ]
    ensure: [ 
      (self utilityClass directoryExists: tempDir)
        ifTrue: [ self utilityClass deleteAll: tempDir ] ]