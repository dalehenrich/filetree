accessing
loadVersionInfo
  self hasMonticelloMetadata
    ifTrue: [ ^ info := self extractInfoFrom: (self parseMember: 'version') ].
  info := MCVersionInfo
    name: self packageNameFromPackageDirectory , '-cypress.1'
    id: UUID new
    message: 'fabricated from a Cypress format repository'
    date: nil
    time: nil
    author: ''
    ancestors: #()
    stepChildren: #()