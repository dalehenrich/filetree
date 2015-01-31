running
setUp
  super setUp.
  Smalltalk at: #'CypressMockIssue97' ifPresent: [ :cl | cl removeFromSystem ].
  (Object selectors includes: #'isCypressMockIssue97')
    ifTrue: [ Object removeSelector: #'isCypressMockIssue97' ]