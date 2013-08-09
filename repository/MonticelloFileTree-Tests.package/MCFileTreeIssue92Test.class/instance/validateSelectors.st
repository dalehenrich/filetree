tests
validateSelectors
  | cls selectors expectedSelectors objectClassSelectors objectSelectors |
  #('Issue92') do: [ :pn | self assert: (self hasPackage: pn) ].
  expectedSelectors := #(#'IssueNumber92:AndArg2:' #'issueNumber92:andArg2:' #'issuenumber92:andarg2:').
  cls := Smalltalk classNamed: #'CCC'.
  2
    timesRepeat: [ 
      selectors := cls selectors.
      self assert: selectors size == expectedSelectors size.
      expectedSelectors
        do: [ :selector | self assert: (selectors includes: selector) ].
      cls := cls class ].
  objectSelectors := Object selectors.
  objectClassSelectors := Object class selectors.
  expectedSelectors
    do: [ :selector | 
      self assert: (objectSelectors includes: selector).
      self assert: (objectClassSelectors includes: selector) ]