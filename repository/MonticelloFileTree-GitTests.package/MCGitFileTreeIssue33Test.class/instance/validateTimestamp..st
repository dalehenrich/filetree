private
validateTimestamp: timestamp
    | x y |
    self
        assert:
            (y := (x := RGMethodDefinition realClass: (Smalltalk at: #'CCC') selector: #'printString') stamp) = timestamp.
    self
        assert:
            (x := RGMethodDefinition realClass: (Smalltalk at: #'CCC') class selector: #'token:') stamp = 'dkh 11/2/1954 16:00'.
    self assert: (x := RGMethodDefinition realClass: Object selector: #'aFiletreeCCCMethod') stamp = 'dkh 11/2/1954 16:19'.
    self
        assert:
            (x := RGMethodDefinition realClass: Object class selector: #'aFiletreeCCCClassMethod') stamp = 'dkh 11/2/1954 16:19'