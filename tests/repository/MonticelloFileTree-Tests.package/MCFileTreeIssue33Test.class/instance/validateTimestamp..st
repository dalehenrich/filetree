private
validateTimestamp: timestamp
    | x y |
    self
        assert:
            (y := (x := RGMethodDefinition realClass: (Smalltalk at: #'CCC') selector: #'printString') stamp) = timestamp.
    self
        assert:
            (x := RGMethodDefinition realClass: (Smalltalk at: #'CCC') class selector: #'token:') stamp = timestamp.
    self assert: (x := RGMethodDefinition realClass: Object selector: #'aFiletreeCCCMethod') stamp = timestamp.
    self
        assert:
            (x := RGMethodDefinition realClass: Object class selector: #'aFiletreeCCCClassMethod') stamp = timestamp