utilities
extractDependencyInfoFor: packageName
  | depInfo |
  depInfo := super extractDependencyInfoFor: packageName.
  self hasGitFileTreeMetadata
    ifFalse: [ depInfo name: packageName , '-cypress.1' ].
  ^ depInfo