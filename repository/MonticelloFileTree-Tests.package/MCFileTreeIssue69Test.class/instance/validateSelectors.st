tests
validateSelectors
  | cls selectors |
  #('Issue69') do: [ :pn | self assert: (self hasPackage: pn) ].
  cls := Smalltalk classNamed: #'CCC'.
  2
    timesRepeat: [ 
      selectors := cls selectors.
      self assert: selectors size == 3.
      #(#'!!<=!!' #'!!<=' #'<=!!')
        do: [ :selector | self assert: (selectors includes: selector) ].
      cls := cls class ]