tests
testFlattenVersionInfos

    | versionInfo a s |
    a := self mockVersionInfo: 'a'.
    s := self mockVersionInfo: 's'.
    versionInfo := self mockVersionInfo: 'x' ancestors: {a} stepChildren: {s}.

    self
        assert: (sut flattenVersionInfos: versionInfo)
        equals: {versionInfo . a. s} asSet
        description: 'All ancestors and stepChildren should be in the set'