running
tearDown
  super tearDown.
  Smalltalk at: #'CypressMockIssue97' ifPresent: [ :cl | cl removeFromSystem ]