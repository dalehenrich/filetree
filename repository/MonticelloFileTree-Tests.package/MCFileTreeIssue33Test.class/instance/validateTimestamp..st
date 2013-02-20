private
validateTimestamp: timestamp
    | x y |
    self
        assert:
            (y := (x := SourcedMethodReference class: (Smalltalk at: #'CCC') selector: #'printString') timeStampString) = timestamp.
    self
        assert:
            (x := SourcedMethodReference class: (Smalltalk at: #'CCC') class selector: #'token:') timeStampString = timestamp.
    self assert: (x := SourcedMethodReference class: Object selector: #'aFiletreeCCCMethod') timeStampString = timestamp.
    self
        assert:
            (x := SourcedMethodReference class: Object class selector: #'aFiletreeCCCClassMethod') timeStampString = timestamp