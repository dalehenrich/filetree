tests
validateSelectors
  | cls selectors expectedSelectors |
  #('Issue69') do: [ :pn | self assert: (self hasPackage: pn) ].
  expectedSelectors := #( #'+!' #'_123').
  cls := Smalltalk classNamed: #'CCC'.
  2
    timesRepeat: [ 
      selectors := cls selectors.
      self assert: selectors size == expectedSelectors size.
      expectedSelectors
        do: [ :selector | self assert: (selectors includes: selector) ].
      cls := cls class ]