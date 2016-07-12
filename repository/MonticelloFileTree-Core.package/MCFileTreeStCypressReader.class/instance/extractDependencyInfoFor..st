utilities
extractDependencyInfoFor: packageName
  | depInfo |
  depInfo := super extractDependencyInfoFor: packageName.
  self withMonticelloMetadata
    ifFalse: [ depInfo name: packageName , '-cypress.1' ].
  ^ depInfo