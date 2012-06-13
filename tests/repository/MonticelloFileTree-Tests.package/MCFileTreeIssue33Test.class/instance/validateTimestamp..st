private
validateTimestamp: timestamp
    | x y |
    self
        assert:
            (y := (x := MethodReference class: (Smalltalk at: #'CCC') selector: #'printString') timeStamp) = timestamp.
    self
        assert:
            (x := MethodReference class: (Smalltalk at: #'CCC') class selector: #'token:') timeStamp = timestamp.
    self assert: (x := MethodReference class: Object selector: #'aFiletreeCCCMethod') timeStamp = timestamp.
    self
        assert:
            (x := MethodReference class: Object class selector: #'aFiletreeCCCClassMethod') timeStamp = timestamp