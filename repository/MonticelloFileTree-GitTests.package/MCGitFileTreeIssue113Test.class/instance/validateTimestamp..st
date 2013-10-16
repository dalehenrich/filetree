private
validateTimestamp: timestamp
    | x y |
    self
        assert:
            (y := (x := RGMethodDefinition realClass: (Smalltalk at: #'DDD') selector: #'printString') stamp) = timestamp.
    self
        assert:
            (x := RGMethodDefinition realClass: (Smalltalk at: #'DDD') class selector: #'token:') stamp = timestamp.
    self assert: (x := RGMethodDefinition realClass: Object selector: #'aFiletreeDDDMethod') stamp = timestamp.
    self
        assert:
            (x := RGMethodDefinition realClass: Object class selector: #'aFiletreeDDDClassMethod') stamp = timestamp