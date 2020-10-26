tests
validateSelectors
  | cls selectors expectedSelectors |
  #('Issue231') do: [ :pn | self assert: (self hasPackage: pn) ].
  expectedSelectors := #(#'myMethodName' #'myMethodName2').
  cls := Smalltalk classNamed: #'CCC'.
  selectors := cls selectors.
  self assert: selectors size == expectedSelectors size.
  expectedSelectors
    do: [ :selector | self assert: (selectors includes: selector) ]