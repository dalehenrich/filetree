as yet unclassified
validatePackageMetadata
  | wc snapshot orgDef categoryString versionInfo messageString |
  wc := MCWorkingCopy allManagers
    detect: [ :each | each packageName = 'Issue72' ].
  snapshot := wc package snapshot.
  orgDef := snapshot definitions
    detect: [ :each | each isOrganizationDefinition ].
  categoryString := self categoryString.
  self assert: (orgDef categories includes: categoryString).
  versionInfo := wc ancestry ancestors first.
  messageString := self versionInfoMessageString.
  self assert: versionInfo message = messageString